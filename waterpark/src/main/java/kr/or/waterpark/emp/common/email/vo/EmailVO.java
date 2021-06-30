package kr.or.waterpark.emp.common.email.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import kr.or.waterpark.common.vo.FilesVO;
import lombok.Data;
import lombok.ToString;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@ToString(exclude= {"email_cont","fileList"})
public class EmailVO implements Serializable{
	
	public EmailVO(String emp_id,String email_del) {
		super();
		this.emp_id = emp_id;
		this.email_del = email_del;
	}
	
	private Integer rnum;
	private String receiver_name;
	private String receive_date;
	private String sender_id;
	private String receiver_id;
	private Integer email_no;
	private String emp_id;
	private String send_date;
	private StringBuffer ex_cont;
	@NotBlank
	private String email_title;
	@NotBlank
	private String email_cont;
	private String email_del;
	
	private String email_reserve;
	private String sender_name;
	private Integer file_no;
	private List<Integer> readList;
	
	@NotBlank
	private List<String> email_id_list;
	
	//여러 파일 첨부 기능 추가 
	private List<FilesVO> fileList;
	private MultipartFile[] email_files;
	public void setEmail_files(MultipartFile[] email_files) {
		this.email_files = email_files;
		if(email_files!=null) {
			List<FilesVO> fileList = new ArrayList<>();
			for(MultipartFile file : email_files) {
				if(file.isEmpty()) continue;
				fileList.add(new FilesVO(file));
			}
			if(fileList.size()>0)
				this.fileList = fileList;
		}
	}
}
