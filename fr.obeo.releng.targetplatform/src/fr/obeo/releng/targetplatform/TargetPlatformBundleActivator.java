/*******************************************************************************
 * Copyright (c) 2012-2014 Obeo.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 * 
 * Contributors:
 *     Mikael Barbero (Obeo) - initial API and implementation
 *******************************************************************************/
package fr.obeo.releng.targetplatform;

import java.util.Collections;
import java.util.Map;

import org.apache.log4j.Logger;
import org.eclipse.core.runtime.IStatus;
import org.eclipse.core.runtime.Plugin;
import org.eclipse.core.runtime.Status;
import org.eclipse.equinox.p2.core.IProvisioningAgent;
import org.eclipse.equinox.p2.core.IProvisioningAgentProvider;
import org.eclipse.equinox.p2.core.ProvisionException;
import org.eclipse.equinox.p2.repository.metadata.IMetadataRepositoryManager;
import org.osgi.framework.BundleContext;
import org.osgi.framework.ServiceReference;

import com.google.common.collect.Maps;
import com.google.inject.Guice;
import com.google.inject.Injector;
import com.google.inject.Module;

import fr.obeo.releng.targetplatform.util.PreferenceSettings;


/**
 * @author <a href="mailto:mikael.barbero@obeo.fr">Mikael Barbero</a>
 *
 */
public class TargetPlatformBundleActivator extends Plugin {

	public static final String PLUGIN_ID = "fr.obeo.releng.targetplatform";
	
	public static final String TARGET_PLATFORM_LANGUAGE_NAME = "fr.obeo.releng.TargetPlatform";
	
	private static final Logger logger = Logger.getLogger(TargetPlatformBundleActivator.class);
	
	private static TargetPlatformBundleActivator INSTANCE;
	
	private Map<String, Injector> injectors;

	private BundleContext context;
	
	private IProvisioningAgent agent;
	
	@Override
	public void start(BundleContext context) throws Exception {
		super.start(context);
		
		INSTANCE = this;
		this.context = context;
		injectors = Collections.synchronizedMap(Maps.<String, Injector> newHashMapWithExpectedSize(1));
	}
	
	@Override
	public void stop(BundleContext context) throws Exception {
		IProvisioningAgent oldAgent = agent;
		agent = null;
		if (oldAgent != null) {
			oldAgent.stop();
		}
		
		injectors.clear();
		
		context = null;
		INSTANCE = null;
		
		super.stop(context);
	}
	
	public static TargetPlatformBundleActivator getInstance() {
		return INSTANCE;
	}
	
	public PreferenceSettings getPreferenceSettings() {
		Injector injector = getInjector(TargetPlatformBundleActivator.TARGET_PLATFORM_LANGUAGE_NAME);
		PreferenceSettings preferenceSettings = injector.getInstance(PreferenceSettings.class);
		return preferenceSettings;
	}
	
	public Injector getInjector(String language) {
		synchronized (injectors) {
			Injector injector = injectors.get(language);
			if (injector == null) {
				injectors.put(language, injector = createInjector(language));
			}
			return injector;
		}
	}
	
	public void registerInjector(String language, Injector injector) {
		synchronized (injectors) {
			if (!injectors.containsKey(language)) {
				injectors.put(language, injector);
			}
			else {
				throw new RuntimeException("Error, try to register: " + language + " twice");
			}
		}
	}
	
	protected Injector createInjector(String language) {
		try {
			Module runtimeModule = getRuntimeModule(language);
			return Guice.createInjector(runtimeModule);
		} catch (Exception e) {
			logger.error("Failed to create injector for " + language);
			logger.error(e.getMessage(), e);
			throw new RuntimeException("Failed to create injector for " + language, e);
		}
	}
	
	public IProvisioningAgent getProvisioningAgent() {
		if (agent == null) {
			ServiceReference<?> serviceReference = context.getServiceReference(IProvisioningAgentProvider.class.getName());
			if (serviceReference != null) {
				IProvisioningAgentProvider agentProvider = (IProvisioningAgentProvider) context.getService(serviceReference);
				if (agentProvider != null) {
					try {
						agent = agentProvider.createAgent(getStateLocation().toFile().toURI());
						initializeServices(agent);
					} catch (ProvisionException e) {
						getLog().log(new Status(IStatus.ERROR, PLUGIN_ID, e.getMessage(), e));
					} catch (IllegalStateException e) {
						getLog().log(new Status(IStatus.ERROR, PLUGIN_ID, e.getMessage(), e));
					}
				}
				context.ungetService(serviceReference);
			}
		}
		return agent;
	}
	
	private void initializeServices(IProvisioningAgent agent2) {
		// TargetPlatformRepositoryManager is implementation specific since it inherits from MetadataRepositoryManager
		// (inner element ofOSGi bundle), if anything changes it may fail => working without retry attempts but not crashed
		try {
			agent2.registerService(IMetadataRepositoryManager.SERVICE_NAME, new TargetPlatformRepositoryManager(agent2));
		} catch (Exception e) {
			System.out.println("[WARNING] Retry attempts when loading repository may not work (exception = " +
					e.getClass().getSimpleName() + ", " + e.getMessage() + ")");
		}
	}
	
	protected Module getRuntimeModule(String grammar) {
		if (TARGET_PLATFORM_LANGUAGE_NAME.equals(grammar)) {
			return new TargetPlatformRuntimeModule();
		}
		
		throw new IllegalArgumentException(grammar);
	}
	
}
