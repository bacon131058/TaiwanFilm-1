package com.web.shoppingCart.dao.impl;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.shoppingCart.dao.OrderDao;
import com.web.shoppingCart.model.OrderBean;

// 本類別
//   1.新增一筆訂單到orders表格
//   2.查詢orders表格內的單筆訂單
//   3.查詢orders表格內的所有訂單

@Repository
public class OrderDaoImpl_Hibernate implements OrderDao {

	private String memberId = null;
	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	int orderNo = 0;

	public OrderDaoImpl_Hibernate() {
//		factory = HibernateUtils.getSessionFactory();
	}

	@Override
	public void insertOrder(OrderBean ob) {
		Session session = factory.getCurrentSession();
		session.save(ob);
	}

	public OrderBean getOrder(int orderNo) {
		OrderBean ob = null;
		Session session = factory.getCurrentSession();
		ob = session.get(OrderBean.class, orderNo);
		return ob;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public void setConnection(Connection con) {
		throw new RuntimeException("OrderDaoImpl_Hibernate類別不用實作此方法");
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<OrderBean> getAllOrders() {
		List<OrderBean> list = null;
		String hql = "FROM OrderBean";
		Session session = factory.getCurrentSession();

		list = session.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderBean> getMemberOrders(Integer memberId) {
		List<OrderBean> list = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM OrderBean ob WHERE ob.memberId = :mid";
		list = session.createQuery(hql).setParameter("mid", memberId).getResultList();
		return list;
	}

	@Override
	public Integer getLatestMemOrder(Integer memberId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM OrderBean  WHERE memberId = :mid order by orderDate desc";
		OrderBean orderNo = (OrderBean) session.createQuery(hql).setParameter("mid", memberId).getResultList().get(0);
		
		System.out.println("orderNo=="+orderNo);
		return orderNo.getOrderNo();
	}

}