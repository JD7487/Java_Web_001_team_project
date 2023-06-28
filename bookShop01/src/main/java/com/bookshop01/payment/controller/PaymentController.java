package com.bookshop01.payment.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bookshop01.payment.service.PaymentService;


//@controller�� @RestController�� �ٸ��ϴ�.
@RestController 
public class PaymentController {
	@Autowired
	private PaymentService paymentService;
	
	@RequestMapping(value="/payment/kakao/order.do")
	public Map<String,String> kakaoOrder(@RequestParam Map<String, String> receiverMap)  throws Exception{
		
		Map<String,String> resultMap = new HashMap<String,String>();
		
		//����� �������� Ȯ��
		System.out.println("kakaoOrder Ȯ��");
		
		//�ֹ� API�� �������
		
		//��� ����� �������� �׽�Ʈ ������
		
		resultMap = paymentService.kakaoOrder(receiverMap);
		/* resultMap.put("test","test��");  �ƿ�ǲ Ȯ��*/
		
		return resultMap;
	}
}
