package com.sub.blog.helpers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class ImageSet {

	//========================================
	// Drgesh method gula re static banaiya korsilo
	//========================================
	
	public boolean deleteImage(String path) {
		try {
			File file = new File(path);
			if(file.delete()) {
				System.out.println("file deleted");				
			}else {
				System.out.println("Failed to delete image");
			}
			return file.delete();
		} catch (Exception e) {
			System.out.println("Imageset, delete Method error! \n"+ e);
			return false;
		}
	}
	
	
	public boolean uploadImage(InputStream is, String path) {
		/*Explaination*/
		/*
		 * step 1: InputStrem class er moddhe diye form theke paoya file ta asbe/store
		 * hobe. step 2: ekta array banate hobe jetate amra file ta byte akare store
		 * korbo N.B: array er size hobe file er size joto [is.available()];
		 */
		
		try {
			byte b[] = new byte[is.available()]; /*jototuk 'is' maximum store korte parbe*/
			
			is.read(b); //'is' er value 'b' er moddhe rakha hocche
			
			
			/* Writing the file into a specific path */
			FileOutputStream fos = new FileOutputStream(new File(path));			
			fos.write(b);
			fos.flush();
			fos.close();
			return true;
			
		}catch (Exception e) {
			System.out.println("Image upload fail. " + e);
			return false;	
		}
		
			
	}
	
}
