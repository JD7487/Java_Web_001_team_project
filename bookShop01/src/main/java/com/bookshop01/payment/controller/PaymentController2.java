package com.bookshop01.payment.controller;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.payment.service.PaymentService;
@Controller
public class PaymentController2 {
	@Autowired
	private PaymentService paymentService;
	
	// orderGoodsForm.jsp ���� function m_Completepayment(FormOrJson, closeEvent) �Լ����� ȣ��� ��
	// METHOD �� ���� ��� ��� ��� GET/ POST
	@RequestMapping(value="/payment/kakao/pay.do")
	public ModelAndView kakaoPay(@RequestParam Map<String, String> receiverMap)  throws Exception{
		
		
		ModelAndView mav = new ModelAndView();	
				
		System.out.println("���� ������ Ȯ�� = " + receiverMap.toString());
		
		Map<String,String> resultMap = new HashMap<String,String>();
		
		resultMap = paymentService.kakaoPay(receiverMap);  //�׽�Ʈ�� ���� �ּ�ó�� (īī�� ����)	
		
		//resultMap ���� ��� ������ ����ֽ��ϴ�.
		
		String responseCode = resultMap.get("responseCode");   //�׽�Ʈ�� ���� �ּ�ó��( īī�� ����)
		
		
		if("0000".equals(responseCode)) 
		{
			//���οϷ�
			//� �������� ���� ����
			mav.setViewName("/payment/kakaoS");		
			
			//�������� ����� ������ �ֱ�
		//	mav.addObject("amount",resultMap.get("amount"));
		//	mav.addAllObjects("authDate",resultMap.get("amount"));
			
			
			//����� ������ �ֱ�
			mav.addObject("kakaoData",resultMap);
		
		}
		else
		{
			//���ν���
			mav.setViewName("/payment/kakaoF");
		}
		
		return mav;
	}
	
	// ���̹� ī�� ����
	// orderGoodsForm.jsp ���� function m_Completepayment(FormOrJson, closeEvent) �Լ����� ȣ��� ��
	// METHOD �� ���� ��� ��� ��� GET/ POST
	@RequestMapping(value="/payment/naver_card/pay.do")
	public ModelAndView naverCardPay(@RequestParam Map<String, String> receiverMap)  throws Exception{
		
		
		ModelAndView mav = new ModelAndView();	
				
		System.out.println("���� ������ Ȯ�� = " + receiverMap.toString());
		
		Map<String,String> resultMap = new HashMap<String,String>();
		
		resultMap = paymentService.naverPay(receiverMap);  //�׽�Ʈ�� ���� �ּ�ó�� (���̹� ����)	
		
		//resultMap ���� ��� ������ ����ֽ��ϴ�.
		
		String responseCode = resultMap.get("responseCode");   //�׽�Ʈ�� ���� �ּ�ó��( ���̹� ����)
		
		
		if("0000".equals(responseCode)) 
		{
			//���οϷ�
			//� �������� ���� ����
			mav.setViewName("/payment/naverS");		
			
			//�������� ����� ������ �ֱ�
		//	mav.addObject("amount",resultMap.get("amount"));
		//	mav.addAllObjects("authDate",resultMap.get("amount"));
			
			
			//����� ������ �ֱ�
			mav.addObject("naverData",resultMap);
		
		}
		else
		{
			//���ν���
			mav.setViewName("/payment/naverF");
		}
		
		return mav;
	}
	
	// ���̹� ����Ʈ ����
	// orderGoodsForm.jsp ���� function m_Completepayment(FormOrJson, closeEvent) �Լ����� ȣ��� ��
	// METHOD �� ���� ��� ��� ��� GET/ POST
	@RequestMapping(value="/payment/naver_point/pay.do")
	public ModelAndView naverPointPay(@RequestParam Map<String, String> receiverMap)  throws Exception{
		
		
		ModelAndView mav = new ModelAndView();	
				
		System.out.println("���� ������ Ȯ�� = " + receiverMap.toString());
		
		Map<String,String> resultMap = new HashMap<String,String>();
		
		resultMap = paymentService.naverPay(receiverMap);  //�׽�Ʈ�� ���� �ּ�ó�� (���̹� ����)	
		
		//resultMap ���� ��� ������ ����ֽ��ϴ�.
		
		String responseCode = resultMap.get("responseCode");   //�׽�Ʈ�� ���� �ּ�ó��( ���̹� ����)
		
		
		if("0000".equals(responseCode)) 
		{
			//���οϷ�
			//� �������� ���� ����
			mav.setViewName("/payment/naverS");		
			
			//�������� ����� ������ �ֱ�
		//	mav.addObject("amount",resultMap.get("amount"));
		//	mav.addAllObjects("authDate",resultMap.get("amount"));
			
			
			//����� ������ �ֱ�
			mav.addObject("naverData",resultMap);
		
		}
		else
		{
			//���ν���
			mav.setViewName("/payment/naverF");
		}
		
		return mav;
	}
}
