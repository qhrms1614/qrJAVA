package com.travel.pro;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface iTravel {
	
	// Mypage
	
	void ChangePW(String userid,String password,String password1);
	void ChangePH(String userid,String phone,String phone1);
	
	
	ArrayList<member> memberinfo();
	member loadMember(String userid);
	member idpw(String userid,String password);
	
//	게시글
	   ArrayList<NoticeDTO> n_List(N_Criteria cri);
	   NoticeDTO n_content(int bno);
	   int n_getTotal(N_Criteria cri);
	   void n_Write(String title,String content,String writer);
	   void n_Update(String title,String content,int bno);
	   void n_delete(int bno);

	
//	댓글
	   ArrayList<Reply> r_list(int bno);
	   void rm_Write(int bno,String writer,String content);
	   int max_grps(int grp);
	   int rno_grp(int rno);
	   int r_count(int bno);
	   int rno_num();
	   void rc_Write(int bno,int grp,int grps,String writer,String content);
	   void rm_Update(int rno);
	   void r_Update(String content,int rno);
	   void r_DelUp(String content,int rno);
	   void r_Delete(int rno);
	
//	--------------------------------- �씠 �씠�썑遺��꽣 �떎瑜� ���썝 �떞�떦
	
//	�뿬�뻾�젙蹂�
	ArrayList<tra> selinfo1(Criteria cri);

	ArrayList<tra> stay(Criteria cri);
	ArrayList<tra> selJjim(String userid);
	void insertJjim(String userid,int id,String loc);
	void selDelete(int id,String loc);
	int t_getTotal(Criteria cri);
	int t_getTotal1(Criteria cri);

	ArrayList<tra> selJjim1(String userid);
	void insertJjim1(String userid,int id,String loc);
	void selDelete1(int id,String loc);
	
	ArrayList<jjim> inJjim(String userid);

	ArrayList<jjim> inJjim1(String userid);
	ArrayList<tra> selinfo(String info);
	ArrayList<tra> getmap();
	ArrayList<city> getcity();
	ArrayList<bando> getcod(String loc);
	ArrayList<bando> getban();
	ArrayList<bando> topadr();
	ArrayList<member> lookMember(String userid);
	void deleteMember(String userid);

	
//	�쉶�썝媛��엯,濡쒓렇�씤,濡쒓렇�븘�썐,�쉶�썝�깉�눜,�븘�씠�뵒鍮꾨쾲李얘린
	   ArrayList<tra> selinfo();
	   int idcheck(@Param("userid") String userid);
	   Member_dto usercheck(@Param("userid") String userid);
	   String find_id(@Param("username")String username,@Param("phone")String phone);
	   String find_pw(@Param("username")String username,@Param("phone")String phone,@Param("userid") String userid);
	   void insertMember(@Param("userid") String userid,@Param("password") String password,@Param("username")String username,@Param("birthday")String birthday,@Param("phone")String phone);
}