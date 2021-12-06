package Bind;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;

public class Bindimg {
	public static String img(Blob blob) throws SQLException, IOException {
		InputStream inputStream = blob.getBinaryStream();
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        //bytesRead = inputStream.read(buffer);
        while ((bytesRead = inputStream.read(buffer)) != -1 ) {
            outputStream.write(buffer, 0, bytesRead);
        }
        System.out.println(blob);
        byte[] imageBytes = outputStream.toByteArray();
        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
        System.out.println(base64Image);
        inputStream.close();
        outputStream.close();
        return base64Image;
	}

}
