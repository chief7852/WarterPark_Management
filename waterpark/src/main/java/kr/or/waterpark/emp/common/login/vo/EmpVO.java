package kr.or.waterpark.emp.common.login.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import kr.or.waterpark.common.vo.FilesVO;
import kr.or.waterpark.common.vo.LisenceVO;
import kr.or.waterpark.emp.common.report.vo.ReportVO;
import kr.or.waterpark.emp.common.work.vo.WorkVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude= {"fileList"})
@EqualsAndHashCode(of="emp_id")
public class EmpVO implements Serializable{
	
	private static final long serialVersionUID = 1L;

	public EmpVO(String emp_id, String user_auth, String email_del) {
		super();
		this.emp_id = emp_id;
		this.user_auth = user_auth;
		this.email_del = email_del;
	}
	
	private String emp_id;
	@NotNull
	private String emp_pass;
	@NotNull
	private String emp_name;
	@NotNull
	private String emp_hp;
	
	private String response_id;
	@NotNull
	private String response_code;
	@NotNull
	private String emp_mail;
	@NotNull
	private String team_code;
	@NotNull
	private String emp_hire;
	private String emp_fire;
	private int emp_vac;
	private String emp_protect;
	@NotNull
	private String fc_id;
	private String user_auth;
	private String email_del;
	private String team_name;
	@NotNull
	private String response_name;
	private String textSearch;
	private String fc_name;
	private Integer file_no;
	private String file_biz;
	private String lempf_code;
	private List<Integer> readList;
	private List<ReportVO> reportList;
	private List<LisenceVO> lisenceList;
	private List<FilesVO> fileList;
	private MultipartFile[] emp_files;
	
	public void setEmp_files(MultipartFile[] emp_files) {
		this.emp_files = emp_files;
		if(emp_files!=null) {
			List<FilesVO> fileList = new ArrayList<>();
			for(MultipartFile file : emp_files) {
				if(file.isEmpty()) continue;
				fileList.add(new FilesVO(file));
			}
			if(fileList.size()>0)
				this.fileList = fileList;
		}
	}
	
}
