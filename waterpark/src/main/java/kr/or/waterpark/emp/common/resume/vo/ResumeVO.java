package kr.or.waterpark.emp.common.resume.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.itextpdf.layout.Document;

import kr.or.waterpark.common.vo.FilesVO;
import kr.or.waterpark.emp.common.login.vo.EmpVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString
@AllArgsConstructor
public class ResumeVO implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private EmpVO emp;
	private String cont_month;
	private String cont_date;
	private String cont_year;
	private String emp_id;
	private String emp_birth;
	private String emp_chinese;
	private String email;
	private String emp_hp; 
	private String address; 
	private String emergency_call;
	private List<EduHistory> degrees;
	private List<CareerVO> careers;
	private String remark;
	private FilesVO resume_file;
	private String pdf_content;
	private String  empf_del;
	private String lempf_code;
	private Integer file_no;
	private String file_biz;
	private String response_name;
	//여러 파일 첨부 기능 추가 
	private List<FilesVO> fileList;
	private MultipartFile[] resume_files;
	public void setResume_files(           MultipartFile[] resume_files) {
		this.resume_files = resume_files;
		if(resume_files!=null) {
			List<FilesVO> fileList = new ArrayList<>();
			for(MultipartFile file : resume_files) {
				if(file.isEmpty()) continue;
				fileList.add(new FilesVO(file));
			}
			if(fileList.size()>0)
				this.fileList = fileList;
		}
	}

}
