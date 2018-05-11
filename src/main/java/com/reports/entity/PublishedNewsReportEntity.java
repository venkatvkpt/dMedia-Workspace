package com.reports.entity;


public class PublishedNewsReportEntity {
	

	private int sno;
	
	private String newsId;
	
	private String articleName;
	
	private String date;
	
	private String typeOfNews;

	public int getSno() {
		return sno;
	}


	public void setSno(int sno) {
		this.sno = sno;
	}


	public String getNewsId() {
		return newsId;
	}


	public void setNewsId(String newsId) {
		this.newsId = newsId;
	}


	public String getArticleName() {
		return articleName;
	}


	public void setArticleName(String articleName) {
		this.articleName = articleName;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public String getTypeOfNews() {
		return typeOfNews;
	}


	public void setTypeOfNews(String typeOfNews) {
		this.typeOfNews = typeOfNews;
	}

   
}