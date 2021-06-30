package kr.or.waterpark.emp.team.snack.controller;

import java.io.File;
import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.zxing.WriterException;

import kr.or.waterpark.Constants;
import kr.or.waterpark.common.utils.CryptoUtil;
import kr.or.waterpark.common.utils.QRCodeUtils;

@Controller
public class QRCodeController {
	private int num = 99;
	
    @RequestMapping("/poket/qrcodecreate")
    @ResponseBody
    public void poketCoinQR(
            @RequestParam("pocketid") String pocketid,
//            @RequestParam("info_no") String info_no,
//            @RequestParam("coin_start") String coin_start,
//            @RequestParam("coin_end") String coin_end,
            HttpServletResponse response)
            throws IOException, WriterException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
    	String coin_code = CryptoUtil.encryptAES256(pocketid, Constants.POCKETKEY);
    	String json = String.format("{"
    			+ "\"coin_code\" : \"%s\""
//    			+ "\"res_info_code\" : \"%s\","
//    			+ "\"coin_start\" : \"%s\","
//    			+ "\"coin_end\" :\"%s\""
    			+ "}", coin_code); 
//    	
			
			
			System.out.println(json);
        ServletOutputStream sos = response.getOutputStream();
//        QRCodeUtils.text2QRCode(json, num, num,"d:/asds");
        QRCodeUtils.text2QRCode(json, num, num, sos);
        sos.flush();
        sos.close();
    }
    
    @RequestMapping("/reserveView/qrcodecreate")
    public void reserveCoinQR(
    		@RequestParam("res_code_encode") String res_code_encode,
            @RequestParam("res_date") String res_date, 
            HttpServletResponse response)
            throws IOException, WriterException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
    	// 이미 res_code_encdoe는 암호화된 상태로 넘어온다.
//    	res_code_encode = CryptoUtil.encryptAES256(res_code_encode, Constants.ENCODEKEYFORRESCODE);
    	String json = String.format("{"
    			+ "\"res_code\" : \"%s\","
    			+ "\"res_date\" : \"%s\""
    			+ "}", res_code_encode, res_date); 
//    	
			
			
		System.out.println(json);
        ServletOutputStream sos = response.getOutputStream();
        QRCodeUtils.text2QRCode(json, num, num, sos);
        sos.flush();
        sos.close();
    }

}
