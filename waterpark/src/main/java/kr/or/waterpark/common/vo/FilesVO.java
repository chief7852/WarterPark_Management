package kr.or.waterpark.common.vo;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author 김도윤
 * @since 2021. 5. 22.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 22.    김도윤         최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode
@NoArgsConstructor
@ToString(of= {"file_no", "file_ord", "file_origin","file_biz"})
public class FilesVO implements Serializable {
	
	private transient MultipartFile file;
	public FilesVO(MultipartFile file) {
		super();
		this.file = file;
		this.file_origin = file.getOriginalFilename();
		this.file_save = UUID.randomUUID().toString();
		this.file_type = file.getContentType();
	}
	
	public FilesVO (int file_no, int file_ord) {
		this.file_no = file_no;
		this.file_ord = file_ord;
	}
	
	private Integer file_no;
	private Integer file_ord;
	private String file_biz;
	private String file_path;
	private String file_origin;
	private String file_save;
	private String file_type;
	private String file_del;
	private String emp_id;
	private String empf_del;
	private String lempf_code;
	
	public void saveTo(File saveFolder) throws IOException {
		file.transferTo(new File(saveFolder, file_save));
	}
	
}
