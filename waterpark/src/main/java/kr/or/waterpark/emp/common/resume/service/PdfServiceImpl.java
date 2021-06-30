package kr.or.waterpark.emp.common.resume.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;

import com.itextpdf.html2pdf.ConverterProperties;
import com.itextpdf.html2pdf.HtmlConverter;
import com.itextpdf.html2pdf.resolver.font.DefaultFontProvider;
import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.font.FontProgramFactory;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.IBlockElement;
import com.itextpdf.layout.element.IElement;
import com.itextpdf.layout.font.FontProvider;

import kr.or.waterpark.common.dao.IFileDAO;
import kr.or.waterpark.common.enumpkg.ServiceResult;
import kr.or.waterpark.common.vo.FilesVO;
import kr.or.waterpark.emp.common.email.vo.EmailVO;
import kr.or.waterpark.emp.common.resume.vo.ResumeVO;
@Service
public class PdfServiceImpl implements IPdfService {

	public static Logger logger = LoggerFactory.getLogger(PdfServiceImpl.class);

	@Inject
	private WebApplicationContext container;
	private ServletContext application;
	
	@Value("#{appInfo['resumeAttachPath']}")
	private String resumeAttachPath;
	private File saveFolder;
	
	@Inject
	IFileDAO fileDAO;
	
	@Override
	public ServiceResult createPDF(ResumeVO resume, String BODY, String DEST) {
		ServiceResult result = ServiceResult.OK;
		String FONT = "D:/temp/fonts/malgun.ttf";
		
		try {
			logger.info("내가 받아온 body : {} " , BODY);
			logger.info("내가 받아온 resume : {} " , resume);
			logger.info("내가 받아온 DEST : {} " , DEST);
			
			ConverterProperties properties = new ConverterProperties();
			FontProvider fontProvider = new DefaultFontProvider(false, false, false);
			FontProgram fontProgram;

			fontProgram = FontProgramFactory.createFont(FONT);
			fontProvider.addFont(fontProgram);
			properties.setFontProvider(fontProvider);
			List<IElement> elements = HtmlConverter.convertToElements(BODY, properties);
			logger.info("변환한 elememts {} ", elements);
			PdfDocument pdf = new PdfDocument(new PdfWriter(DEST));
			pdf.setDefaultPageSize(PageSize.A2);
			Document document = new Document(pdf);
			// setMargins 매개변수순서 : 상, 우, 하, 좌
			document.setMargins(0, 0, 0, 0);
			for (IElement element : elements) {
				document.add((IBlockElement) element);
			}
			document.close(); 
		} catch (IOException e) {
			// TODO Auto-generated catch block
			result = ServiceResult.FAIL;
			e.printStackTrace();
		}

		// pdf 페이지 크기를 조정

		return result;
	}
	
	private int processes(ResumeVO resume) {
		logger.info("파일 첨부를 위한 resume 정보 넘기기  : {} ", resume);
		
		int cnt = 0;
		List<FilesVO> filesList = resume.getFileList();
		
		if(filesList!=null && filesList.size()>0) {
			for(FilesVO file : filesList) {
				file.setFile_path(resumeAttachPath);
				logger.info("file path : {} ", file.getFile_path());
				logger.info("file origin: {} ", file.getFile_origin());
				logger.info("file file_type: {} ", file.getFile_type());
				file.setFile_biz("CR");
			}
			cnt += fileDAO.insertFilesForResume(resume);
			
			try {
				for(FilesVO attatch : filesList) {
					attatch.saveTo(saveFolder);
				}
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
		return cnt;
	}

}
