package com.neurotec.samples;

import java.awt.BorderLayout;
import java.io.IOException;

import javax.swing.JFrame;
import javax.swing.SwingUtilities;

import com.neurotec.licensing.NLicenseManager;
import com.neurotec.samples.util.LibraryManager;
import com.neurotec.samples.util.Utils;
import static spark.Spark.*;
import com.neurotec.devices.NDeviceManager;
import com.neurotec.devices.NDevice;
import java.util.List;
import java.util.ArrayList;
import com.neurotec.samples.models.DeviceDTO;
import com.google.gson.Gson;
import com.neurotec.images.NImage;
import com.neurotec.io.NBuffer;
import java.io.OutputStream;


public final class SimpleFingersApplication {

	// ===========================================================
	// Public static  method
	// ===========================================================

	public static void main(String[] args) {
           SimpleFingersApplication app = new SimpleFingersApplication();
             EnrollFromScannerForAPI scanner = new EnrollFromScannerForAPI();
           
           port(4567);
           Gson gson = new Gson();
            
            get("/api/scanners", (req, res) -> {
                // Implement your logic here
                
                res.type("application/json");
                return gson.toJson(app.getScannerList());
            });
            
            get("/api/scan", (req, res) -> {
                // Implement your logic here
                
                scanner.startCapturingAPI();
                
                res.type("application/json");
                return gson.toJson("Capturing Success");
            });
             get("/api/get-scanned-image", (req, res) -> {
                // Implement your logic here
                
                try{
               byte[] imageBytes = scanner.getScannedImage();
                
                res.type("image/png"); // Or use the appropriate image format (e.g., "image/jpeg")

                // Return the image bytes as the response
                OutputStream outputStream = res.raw().getOutputStream();
                outputStream.write(imageBytes);
                outputStream.flush();
                outputStream.close();
                } catch (Exception e){
                    e.printStackTrace();
                }
                return res.raw();
            });
		Utils.setupLookAndFeel();
		LibraryManager.initLibraryPath();

		//=========================================================================
		// TRIAL MODE
		//=========================================================================
		// Below code line determines whether TRIAL is enabled or not. To use purchased licenses, don't use below code line.
		// GetTrialModeFlag() method takes value from "Bin/Licenses/TrialFlag.txt" file. So to easily change mode for all our examples, modify that file.
		// Also you can just set TRUE to "TrialMode" property in code.
		//=========================================================================

		try {
			boolean trialMode = Utils.getTrialModeFlag();
			NLicenseManager.setTrialMode(true);
			System.out.println("\tTrial mode: " + trialMode);
		} catch (IOException e) {
			e.printStackTrace();
		}

		SwingUtilities.invokeLater(new Runnable() {

			@Override
			public void run() {
				JFrame frame = new JFrame();
				frame.setTitle("HBL Biometric");
				frame.setIconImage(Utils.createIconImage("images/Logo16x16.png"));
				frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
				frame.add(new MainPanel(), BorderLayout.CENTER);
				frame.pack();
				frame.setLocationRelativeTo(null);
				frame.setVisible(true);
			}
		});
	}

	// ===========================================================
	// Private constructor
	// ===========================================================

	private SimpleFingersApplication() {
	}
        
        private List<DeviceDTO> getScannerList(){
          NDeviceManager deviceManager = FingersTools.getInstance().getClient().getDeviceManager();
            List<NDevice> devices = deviceManager.getDevices();
              List<DeviceDTO> deviceDTOs = new ArrayList<>();
            for (NDevice device : devices) {
		 System.out.println(device);
                 DeviceDTO dto = new DeviceDTO(device.toString());
                 deviceDTOs.add(dto);
            }
            return deviceDTOs;
        }
}
