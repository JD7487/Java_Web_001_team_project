package com.bookshop01.payment.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookshop01.api.service.ApiService;

// ī�� ���� ���� �߰�
//@Service ���� �������� Service �������ٶ�� ���� spring���� �˷���� �Ѵ�.
@Service
public class PaymentService 
{
	@Autowired
	private ApiService apiService;
	
	
	public Map<String,String> keyin(Map<String,String> receiverMap)
	{
		Map<String,String> resultMap = new HashMap<String, String>();
		
		//Ctl+Shipt+O �ڵ��ϼ�
		
		//API ���� �ҽ� �ۼ� ����
		//rest api ������ �� ���� 
		//���̺귯�� ����ϸ� ����
		//OkHttp3.10 ���� ���̺귯�� ���   ���۰˻�
	    	
		// ī�� ���� �ֹ��� �ʿ��� ���� ����
		String orderNumber = "";
		String cardNo = "";
		String expireMonth = "";
		String expireYear = "";
		String birthday = "";
		String cardPw = "";
		String amount = "";
		String quota = "";
		String itemName = "";
		String userName = "";
		String signature = "";
		String timestamp = "";
		String certKey = "ac805b30517f4fd08e3e80490e559f8e";
		
		// �����ߵǴ� �� ���� ����
		orderNumber = "TEST1234";
		cardNo =  receiverMap.get("cardNo");
		expireMonth = receiverMap.get("expireMonth");
		expireYear = receiverMap.get("expireYear");
		birthday = receiverMap.get("birthday");
		cardPw = receiverMap.get("cardPw");
		amount = "1000";
		quota = "0";
		itemName = "TEST������";
		userName = "�׽���";		
		timestamp = "20230531121110";
		
		try {
			// ��ȣȭ�ؼ� �����ؾ� ��.
			signature = encrypt("himedia|"+orderNumber+"|"+amount+"|"+certKey+"|"+timestamp);			
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace();
		}
		
		
		//paramMap�� ��û������ ��� ��
		Map<String,String> paramMap = new HashMap<String,String>();
		//��û �ּ�
		// ���߿� �ֹ� api.
		String url = "https://api.testpayup.co.kr/v2/api/payment/himedia/keyin2";
		
		// �����ߵǴ� �� ���� ����	
		paramMap.put("orderNumber",orderNumber);
		paramMap.put("cardNo",cardNo);
		paramMap.put("expireMonth",expireMonth);
		paramMap.put("expireYear",expireYear);
		paramMap.put("birthday",birthday);
		paramMap.put("cardPw",cardPw);
		paramMap.put("amount",amount);
		paramMap.put("quota",quota);
		paramMap.put("itemName",itemName);
		paramMap.put("userName",userName);
		paramMap.put("signature",signature);
		paramMap.put("timestamp",timestamp);
		
		resultMap = apiService.restApi(paramMap, url); 
		
		//���� ���
		System.out.println("���� ���� API ��� ��� = " + resultMap.toString() );
		
		return resultMap;
	}
		
	//īī�� �ֹ� �ϴ� ���
	public Map<String,String> kakaoOrder(Map<String,String> receiverMap){
		
		Map<String,String> resultMap = new HashMap<String, String>();
		
		
		//API ���
		//īī�� 3.1 �ֹ���û
		
		//��û ������ ����
		String orderNumber = "";
		String userAgent = "";
		String amount = "";
		String itemName = "";
		String userName = "";
		String returnUrl = "";
		String signature = "";
		String timestamp = "";
		String certKey = "ac805b30517f4fd08e3e80490e559f8e";
		
		orderNumber = "TEST_ORDER";
		userAgent = "WP";
		amount = "100"; //�ǰ��� �˴ϴ�... �ݾ� ũ���ϸ� �ȵǿ�
		itemName = "�����׽�Ʈ_īī��";
		userName = "choi";
		returnUrl = "test"; //�̰Ŵ� �ƹ����̳� �־�˴ϴ�..
		timestamp = "20230601111111";
		//��ȣȭ�ؼ� �����ؾ���.
		try {
			signature = encrypt("himedia|"+orderNumber+"|"+amount+"|"+certKey+"|"+timestamp);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//paramMap�� ��û������ ��� ��
		Map<String,String> paramMap = new HashMap<String, String>();
		//��û �ּ�
		String url = "https://api.testpayup.co.kr/ep/api/kakao/himedia/order";
		paramMap.put("orderNumber",orderNumber);
		paramMap.put("userAgent",userAgent);
		paramMap.put("amount",amount);
		paramMap.put("itemName",itemName);
		paramMap.put("userName",userName);
		paramMap.put("returnUrl",returnUrl);
		paramMap.put("amount",amount);
		paramMap.put("timestamp",timestamp);
		paramMap.put("signature",signature);
		
		resultMap = apiService.restApi(paramMap, url);
		
		
		//���� ���
		System.out.println("īī�� �ֹ� API ��� ��� = " + resultMap.toString());
		
		return resultMap;
	}
	
	
	public String encrypt(String text) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(text.getBytes());
        return bytesToHex(md.digest());
    }
	
    private String bytesToHex(byte[] bytes) 
    {
        StringBuilder builder = new StringBuilder();
        for (byte b : bytes) {
            builder.append(String.format("%02x", b));
        }
        return builder.toString();
    }
    
    //īī�� ���� ��û
	public Map<String,String> kakaoPay(Map<String,String> receiverMap){
		
		Map<String,String> resultMap = new HashMap<String, String>();			
			
		//3.3 ���ο�û ���� ���� �Ʒ��ҽ� �ϼ�
	   /*
		//��û ������ ����
		String res_cd = "";		
		String enc_info = "";			
		String enc_data = "";				
		String tran_cd = "";			
		String card_pay_method = "";			
		String ordr_idxx = "";
		
		String url = "https://api.testpayup.co.kr/ep/api/kakao/himedia/pay";
		
		resultMap.put("res_cd", receiverMap.get("res_cd"));
		resultMap.put("enc_info",receiverMap.get("enc_info"));
		resultMap.put("enc_data",receiverMap.get("enc_data"));
		resultMap.put("tran_cd",receiverMap.get("tran_cd"));
		resultMap.put("card_pay_method",receiverMap.get("card_pay_method"));
		resultMap.put("ordr_idxx",receiverMap.get("ordr_idxx"));
	*/
		
		String url = "https://api.testpayup.co.kr/ep/api/kakao/himedia/pay";
		resultMap = apiService.restApi(receiverMap, url);
						
		return resultMap;
	}


	//���̹� �ֹ� �ϴ� ��� <������>
	// payType = 'CARD',  POINT �����ڰ� �Ѿ�;� �Ѵ�
	public Map<String,String> naverOrder(Map<String,String> receiverMap){
		
		Map<String,String> resultMap = new HashMap<String, String>();
		
		
		//API ���
		//īī�� 3.1 �ֹ���û
		
		//��û ������ ����
		String orderNumber = "";
		String userAgent = "";
		String amount = "";
		String itemName = "";
		String userName = "";
		String returnUrl = "";
		String signature = "";
		String timestamp = "";
		String certKey = "ac805b30517f4fd08e3e80490e559f8e";
		
		orderNumber = "TEST_ORDER";
		userAgent = "WP";
		amount = "100"; //�ǰ��� �˴ϴ�... �ݾ� ũ���ϸ� �ȵǿ�
		itemName = "�����׽�Ʈ_���̹�";
		userName = "choi";
		returnUrl = "test"; //�̰Ŵ� �ƹ����̳� �־�˴ϴ�..
		timestamp = "20230601111111";
		//��ȣȭ�ؼ� �����ؾ���.
		try {
			signature = encrypt("himedia|"+orderNumber+"|"+amount+"|"+certKey+"|"+timestamp);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//paramMap�� ��û������ ��� ��
		Map<String,String> paramMap = new HashMap<String, String>();
		//��û �ּ�
		String url = "https://api.testpayup.co.kr/ep/api/naver/himedia/order";
		paramMap.put("orderNumber",orderNumber);
		paramMap.put("userAgent",userAgent);
		paramMap.put("amount",amount);
		paramMap.put("itemName",itemName);
		paramMap.put("userName",userName);
		paramMap.put("returnUrl",returnUrl);
		paramMap.put("amount",amount);
		paramMap.put("timestamp",timestamp);
		paramMap.put("signature",signature);
		paramMap.put("payType", receiverMap.get("payType"));  //���̹� ī��(CARD)/������(POINT) ���а�
		
		resultMap = apiService.restApi(paramMap, url);
		
		
		//���� ���
		System.out.println("���̹� �ֹ� API ��� ��� = " + resultMap.toString());
		
		return resultMap;
	}  

	//���̹� ���� ��û
	public Map<String,String> naverPay(Map<String,String> receiverMap){
		
		Map<String,String> resultMap = new HashMap<String, String>();			
			
		//3.3 ���ο�û ���� ���� �Ʒ��ҽ� �ϼ�
	   /*
		//��û ������ ����
		String res_cd = "";		
		String enc_info = "";			
		String enc_data = "";				
		String tran_cd = "";			
		String card_pay_method = "";			
		String ordr_idxx = "";
		
		String url = "https://api.testpayup.co.kr/ep/api/kakao/himedia/pay";
		
		resultMap.put("res_cd", receiverMap.get("res_cd"));
		resultMap.put("enc_info",receiverMap.get("enc_info"));
		resultMap.put("enc_data",receiverMap.get("enc_data"));
		resultMap.put("tran_cd",receiverMap.get("tran_cd"));
		resultMap.put("card_pay_method",receiverMap.get("card_pay_method"));
		resultMap.put("ordr_idxx",receiverMap.get("ordr_idxx"));
	*/
		
		String url = "https://api.testpayup.co.kr/ep/api/naver/himedia/pay";
		resultMap = apiService.restApi(receiverMap, url);
						
		return resultMap;
	}

}
