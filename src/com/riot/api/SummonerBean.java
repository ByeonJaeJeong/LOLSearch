package com.riot.api;

public class SummonerBean {
	String id;
	String accountId;
	String puuid;
	int profileIconId;
	int revisionDate;
	String name;
	int summonerLevel;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public String getPuuid() {
		return puuid;
	}

	public void setPuuid(String puuid) {
		this.puuid = puuid;
	}

	public int getProfileIconId() {
		return profileIconId;
	}

	public void setProfileIconId(int profileIconId) {
		this.profileIconId = profileIconId;
	}

	public int getRevisionDate() {
		return revisionDate;
	}

	public void setRevisionDate(int revisionDate) {
		this.revisionDate = revisionDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSummonerLevel() {
		return summonerLevel;
	}

	public void setSummonerLevel(int summonerLevel) {
		this.summonerLevel = summonerLevel;
	}

	@Override
	public String toString() {
		return "SummonerBean [id=" + id + ", accountId=" + accountId + ", puuid=" + puuid + ", profileIconId="
				+ profileIconId + ", revisionDate=" + revisionDate + ", name=" + name + ", summonerLevel="
				+ summonerLevel + "]";
	}
	
	
}
