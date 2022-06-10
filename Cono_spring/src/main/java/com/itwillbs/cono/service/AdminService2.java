package com.itwillbs.cono.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.cono.mapper.AdminMapper2;
import com.itwillbs.cono.vo.MemberDTO;
import com.itwillbs.cono.vo.PageInfo;

@Service
public class AdminService2 {

	@Autowired
	private AdminMapper2 mapper;
	
	// ------ 회원 수 (관리자) - 김혜은 ------
	public int getMemberListCount(String searchType, String search) {
		
		return mapper.selectMemberListCount(searchType, search);
	}
	
	// ------ 회원 리스트 - 김혜은 ------
	public List<MemberDTO> getMemberList(String searchType, String search, PageInfo pageInfo) {
		
		return mapper.selectAllMember(searchType, search, pageInfo);
	}

}