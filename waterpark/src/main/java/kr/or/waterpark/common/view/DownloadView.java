package kr.or.waterpark.common.view;

import java.io.File;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.view.AbstractView;

import kr.or.waterpark.common.vo.FilesVO;


public class DownloadView extends AbstractView{

	private static final Logger logger =
			LoggerFactory.getLogger(DownloadView.class);

	@Value("#{appInfo.emailAttachPath}")
	private File emailSaveFolder;
	
	@Value("#{appInfo.identificationImages}")
	private File idImageSaveFolder;
	
	@Value("#{appInfo.resumeAttachPath}")
	private File resumeAttachPath;
	
	@PostConstruct
	public void init() {
		logger.info("DownloadView 초기화. ");
		logger.info("{} 초기화, {} 주입됨"
				,getClass().getSimpleName()
				,emailSaveFolder.getAbsolutePath());
	}
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("DownloadView에 들어옴. ");
		FilesVO file = (FilesVO) model.get("file");
		String agent = request.getHeader("User-Agent");
		File saveFile = null;
		
		if(file.getFile_type().contains("image")) {
			saveFile = new File(idImageSaveFolder,file.getFile_save());
		}else if(file.getFile_type().contains("pdf")) {
			saveFile = new File(resumeAttachPath,file.getFile_save());
		}
		else {
			saveFile = new File(emailSaveFolder,file.getFile_save());
		}
		
		String filename = file.getFile_origin();
		if(StringUtils.containsIgnoreCase(agent, "trident")) {
			filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", " ");
		}else {
			byte[] bytes = filename.getBytes();
			filename = new String(bytes,"ISO-8859-1");
		}
		response.setHeader("Content-Disposition", "file;filename=\""+filename+"\"");
		response.setContentType("application/octet-stream");
		try(
			OutputStream os = response.getOutputStream();	
		){
			FileUtils.copyFile(saveFile, os);
		}
		
	}
}
