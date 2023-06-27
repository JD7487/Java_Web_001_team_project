package com.bookshop01.payment.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.payment.service.PaymentService;


//@controller�� @RestController�� �ٸ��ϴ�.
@RestController 
public class PaymentController2 {
	@Autowired
	private PaymentService paymentService;
	
	@RequestMapping(value="/payment/kakao/pay.do")
	public ModelAndView kakaoPay(@RequestParam Map<String, String> receiverMap)  throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		Map<String,String> resultMap = new HashMap<String,String>();
		
		resultMap = paymentService.kakaoPay(receiverMap);
		
		//resultMap ���� ��� ������ �������.
		
		String responseCode = resultMap.get("responseCode");
	
		if ("0000".equals(responseCode)) {
			
			mav.setViewName("/payment/kakaoS");//tiles �������� ����.
			
			//���� ���� ���� ������ �־
			mav.addObject("amount",resultMap.get("amount"));
			mav.addObject("authDateTime",resultMap.get("authDateTime"));

		} else {
			mav.setViewName("/payment/kakaoF");
		}
		
		//����� �������� Ȯ��
		System.out.println("���� ������ Ȯ��" + receiverMap.toString());

		
		return mav;
	}
}
