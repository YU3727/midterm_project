package com.camp.s1.camping;

public class CampSiteDTO {

	private Long areaNum;
	private Long campNum;
	private String siteName;
	private String siteSize;
	private Long offWeekdaysPrice;
	private Long offWeekendsPrice;
	private Long peakWeekdaysPrice;
	private Long peakWeekendsPrice;
	private String status;
	
	public CampSiteDTO() {
		
	}

	public Long getAreaNum() {
		return areaNum;
	}

	public void setAreaNum(Long areaNum) {
		this.areaNum = areaNum;
	}

	public Long getCampNum() {
		return campNum;
	}

	public void setCampNum(Long campNum) {
		this.campNum = campNum;
	}

	public String getSiteName() {
		return siteName;
	}

	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}

	public String getSiteSize() {
		return siteSize;
	}

	public void setSiteSize(String siteSize) {
		this.siteSize = siteSize;
	}

	public Long getOffWeekdaysPrice() {
		return offWeekdaysPrice;
	}

	public void setOffWeekdaysPrice(Long offWeekdaysPrice) {
		this.offWeekdaysPrice = offWeekdaysPrice;
	}

	public Long getOffWeekendsPrice() {
		return offWeekendsPrice;
	}

	public void setOffWeekendsPrice(Long offWeekendsPrice) {
		this.offWeekendsPrice = offWeekendsPrice;
	}

	public Long getPeakWeekdaysPrice() {
		return peakWeekdaysPrice;
	}

	public void setPeakWeekdaysPrice(Long peakWeekdaysPrice) {
		this.peakWeekdaysPrice = peakWeekdaysPrice;
	}

	public Long getPeakWeekendsPrice() {
		return peakWeekendsPrice;
	}

	public void setPeakWeekendsPrice(Long peakWeekendsPrice) {
		this.peakWeekendsPrice = peakWeekendsPrice;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
