package com.bookshop01.payment.controller;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bookshop01.payment.service.PaymentService;

//@controller�� @RestController�� �ٸ��ϴ�.
//RestController json ���·� �����Ͱ� ������.
@RestController
public class PaymentController {
	
	@Autowired
	private PaymentService paymentService;
	
	// method �ɼ��� �����ϸ� ��� ����� �����Ѵ�, GET, POST
	// receiverMap �� orderGoodsForm.jsp ajax ���� �ѱ䰪  data
	@RequestMapping(value="/payment/kakao/order.do" ) // ,method = RequestMethod.POST) 
	public Map<String,String> kakaoOrder(@RequestParam Map<String, String> receiverMap)  throws Exception{
	
		Map<String,String> resultMap = new HashMap<String,String>();
		
		//����� �������� Ȯ��
		System.out.println("kakaoOrder Ȯ��");
		
		resultMap = paymentService.kakaoOrder(receiverMap);
		/*
		Map<String,String> returnServiceMap  = 	paymentService.kakaoOrder(receiverMap);
		
		
		//����� ����� �������� �׽�Ʈ ������		
		resultMap.put("test", "test��");
		
		// ȭ�鿡 �߰��� ���� {good_mny=100, site_cd=A8QOB, Ret_URL=test, affiliaterCode=0005, buyr_name=choi, 
		// ordr_idxx=20230601111756KK0310, good_name=�����׽�Ʈ_īī��, responseCode=0000, responseMsg=����}
		resultMap.put("good_mny",returnServiceMap.get("good_mny"));
		resultMap.put("site_cd",returnServiceMap.get("site_cd"));
		resultMap.put("Ret_URL",returnServiceMap.get("Ret_URL"));
		resultMap.put("affiliaterCode",returnServiceMap.get("affiliaterCode"));
		resultMap.put("buyr_name",returnServiceMap.get("buyr_name"));
		resultMap.put("ordr_idxx",returnServiceMap.get("ordr_idxx"));
		resultMap.put("good_name",returnServiceMap.get("good_name"));
		resultMap.put("responseCode",returnServiceMap.get("responseCode"));
		resultMap.put("responseMsg",returnServiceMap.get("responseMsg"));
		*/
		
		return resultMap;
	}
	
	// īī�������� ���� ����� ��
	// method �ɼ��� �����ϸ� ��� ����� �����Ѵ�, GET, POST
	// receiverMap �� orderGoodsForm.jsp ajax ���� �ѱ䰪  data
	@RequestMapping(value="/payment/naver_card/order.do" ) // ,method = RequestMethod.POST) 
	public Map<String,String> naverOrder(@RequestParam Map<String, String> receiverMap)  throws Exception{
	
		Map<String,String> resultMap = new HashMap<String,String>();
		
		//����� �������� Ȯ��
		System.out.println("naverOrder Ȯ��");
		
		receiverMap.put("payType","CARD");
		resultMap = paymentService.naverOrder(receiverMap);
		/*
		Map<String,String> returnServiceMap  = 	paymentService.kakaoOrder(receiverMap);
		
		
		//����� ����� �������� �׽�Ʈ ������		
		resultMap.put("test", "test��");
		
		// ȭ�鿡 �߰��� ���� {good_mny=100, site_cd=A8QOB, Ret_URL=test, affiliaterCode=0005, buyr_name=choi, 
		// ordr_idxx=20230601111756KK0310, good_name=�����׽�Ʈ_īī��, responseCode=0000, responseMsg=����}
		resultMap.put("good_mny",returnServiceMap.get("good_mny"));
		resultMap.put("site_cd",returnServiceMap.get("site_cd"));
		resultMap.put("Ret_URL",returnServiceMap.get("Ret_URL"));
		resultMap.put("affiliaterCode",returnServiceMap.get("affiliaterCode"));
		resultMap.put("buyr_name",returnServiceMap.get("buyr_name"));
		resultMap.put("ordr_idxx",returnServiceMap.get("ordr_idxx"));
		resultMap.put("good_name",returnServiceMap.get("good_name"));
		resultMap.put("responseCode",returnServiceMap.get("responseCode"));
		resultMap.put("responseMsg",returnServiceMap.get("responseMsg"));
		*/
		
		return resultMap;
	}
	
	// īī�������� ���� ����� ��
		// method �ɼ��� �����ϸ� ��� ����� �����Ѵ�, GET, POST
		// receiverMap �� orderGoodsForm.jsp ajax ���� �ѱ䰪  data
		@RequestMapping(value="/payment/naver_point/order.do" ) // ,method = RequestMethod.POST) 
		public Map<String,String> naverPointOrder(@RequestParam Map<String, String> receiverMap)  throws Exception{
		
			Map<String,String> resultMap = new HashMap<String,String>();
			
			//����� �������� Ȯ��
			System.out.println("naverPointOrder Ȯ��");
			receiverMap.put("payType","POINT");			
			resultMap = paymentService.naverOrder(receiverMap);
			/*
			Map<String,String> returnServiceMap  = 	paymentService.kakaoOrder(receiverMap);
			
			
			//����� ����� �������� �׽�Ʈ ������		
			resultMap.put("test", "test��");
			
			// ȭ�鿡 �߰��� ���� {good_mny=100, site_cd=A8QOB, Ret_URL=test, affiliaterCode=0005, buyr_name=choi, 
			// ordr_idxx=20230601111756KK0310, good_name=�����׽�Ʈ_īī��, responseCode=0000, responseMsg=����}
			resultMap.put("good_mny",returnServiceMap.get("good_mny"));
			resultMap.put("site_cd",returnServiceMap.get("site_cd"));
			resultMap.put("Ret_URL",returnServiceMap.get("Ret_URL"));
			resultMap.put("affiliaterCode",returnServiceMap.get("affiliaterCode"));
			resultMap.put("buyr_name",returnServiceMap.get("buyr_name"));
			resultMap.put("ordr_idxx",returnServiceMap.get("ordr_idxx"));
			resultMap.put("good_name",returnServiceMap.get("good_name"));
			resultMap.put("responseCode",returnServiceMap.get("responseCode"));
			resultMap.put("responseMsg",returnServiceMap.get("responseMsg"));
			*/
			
			return resultMap;
		}
	
}
