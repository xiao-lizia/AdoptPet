package org.liliting.entity;

import java.util.HashMap;
import java.util.List;

public class Page {
	private int count;
	private int pageSize;
	private int totalPage;
	private int currentPage;
	private List<HashMap> hashMap;
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		this.totalPage = this.count%this.pageSize==0? this.count/this.pageSize-1:this.count/this.pageSize;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public List<HashMap> getHashMap() {
		return hashMap;
	}
	public void setHashMap(List<HashMap> hashMap) {
		this.hashMap = hashMap;
	}
	@Override
	public String toString() {
		return "Page [count=" + count + ", pageSize=" + pageSize + ", totalPage=" + totalPage + ", currentPage="
				+ currentPage + ", hashMap=" + hashMap + "]";
	}

}
