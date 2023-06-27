package com.bookshop01.payment.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookshop01.api.service.ApiService;
@Service
public class PaymentService {
	@Autowired
	private ApiService apiService;
	
	public Map<String,String> keyin(Map<String,String> receiverMap){
		
		
		//��Ʈ��+����Ʈ+O(����) �ڵ��ϼ�
		
		Map<String,String> resultMap = new HashMap<String, String>();
		
		//API ���� �ҽ� �ۼ� ����
		
		//rest api ������ �� ����
		//���̺귯���� ����ؼ� ����
		String orderNumber = "";
		String cardNo = "";
		String expireYear = "";
		String expireMonth = "";
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
		//receiverMap.get("cardNo");// ȭ�鿡�� �Է��� ī�� ��ȣ
		orderNumber = "TEST1234";
		cardNo = receiverMap.get("cardNo");
		expireMonth = receiverMap.get("expireMonth");
		expireYear = receiverMap.get("expireYear");
		birthday = receiverMap.get("birthday");
		cardPw = receiverMap.get("cardPw");
		amount = "1000";
		quota = "0";
		itemName = "TEST������";
		userName = "�׽���";
		timestamp = "20230531010112";
		
		
		try {
			
			
			signature = encrypt("himedia|"+orderNumber+"|"+amount+"|"+certKey+"|"+timestamp); //��ȣȭ�ؼ� �����ؾ���.
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		//
		//
		
		//paramMap�� ��û������ ��� ��
		Map<String,String> paramMap = new HashMap<String, String>();
		//��û �ּ�
		String url = "https://api.testpayup.co.kr/v2/api/payment/himedia/keyin2";
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
		
		return resultMap;
	}
	
	public Map<String,String> kakaoOrder(Map<String,String> receiverMap){
		
		Map<String,String> resultMap = new HashMap<String,String> ();
		
		//API ��� īī�� 3.1 �ֹ���û
		
		String orderNumber = "";
		String userAgent = "";
		String amount = "";
		String returnUrl = "";
		String itemName = "";
		String userName = "";
		String signature = "";
		String timestamp = "";
		String certKey = "ac805b30517f4fd08e3e80490e559f8e";

		
		orderNumber = "TEST_ORDER";
		userAgent = "WP";
		amount = "100";
		itemName = "�����׽�Ʈ";
		userName = "jeong";
		returnUrl = "test";
		timestamp = "20230601105011";
		try {
			signature = encrypt("himedia|"+orderNumber+"|"+amount+"|"+certKey+"|"+timestamp);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//apiService.restApi("��û�ϴ� ��", "�ּ�") �����ϴ� �ڵ� ����
		
		//paramMap�� ��û������ ��� ��
		Map<String,String> paramMap = new HashMap<String, String>();
		//��û �ּ�
		String url = "https://api.testpayup.co.kr/ep/api/kakao/himedia/order";
		paramMap.put("orderNumber",orderNumber);
		paramMap.put("userAgent",userAgent);
		paramMap.put("amount",amount);
		paramMap.put("returnUrl",returnUrl);
		paramMap.put("itemName",itemName);
		paramMap.put("userName",userName);
		paramMap.put("signature",signature);
		paramMap.put("timestamp",timestamp);
		
		resultMap = apiService.restApi(paramMap, url);
		
		System.out.println("īī�� �ֹ� API ��� ��� = " + resultMap.toString());
		
		return resultMap;
	}
	
	//īī�� ���� ��û
		public Map<String,String> kakaoPay(Map<String,String> receiverMap){
			
			Map<String,String> resultMap = new HashMap<String, String>();

			//�ҽ�....

			String res_cd = "";
			String enc_info = "";
			String enc_data = "";
			String tran_cd = "";
			String card_pay_method = "";
			String ordr_idxx = "";
			
			//apiService.restApi("��û�ϴ� ��", "�ּ�") �����ϴ� �ڵ� ����
			
			res_cd = receiverMap.get("res_cd");
			enc_info = receiverMap.get("enc_info");
			enc_data = receiverMap.get("enc_data");
			tran_cd = receiverMap.get("tran_cd");
			card_pay_method = receiverMap.get("card_pay_method");
			ordr_idxx = receiverMap.get("ordr_idxx");
			
			//paramMap�� ��û������ ��� ��
			Map<String,String> paramMap = new HashMap<String, String>();
			//��û �ּ�
			String url = "https://api.testpayup.co.kr/ep/api/kakao/himedia/pay";
			paramMap.put("res_cd",res_cd);
			paramMap.put("enc_info",enc_info);
			paramMap.put("enc_data",enc_data);
			paramMap.put("tran_cd",tran_cd);
			paramMap.put("card_pay_method",card_pay_method);
			paramMap.put("ordr_idxx",ordr_idxx);

			
			resultMap = apiService.restApi(paramMap, url);
			System.out.println("���ΰ��" + resultMap.toString());
			return resultMap;
		}
		
		
	public String encrypt(String text) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(text.getBytes());
        return bytesToHex(md.digest());
    }
    private String bytesToHex(byte[] bytes) {
        StringBuilder builder = new StringBuilder();
        for (byte b : bytes) {
            builder.append(String.format("%02x", b));
        }
        return builder.toString();
    }

}