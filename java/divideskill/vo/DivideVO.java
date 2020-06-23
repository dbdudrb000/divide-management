package collabo.wato.springboot.web.divideskill.vo;

public class DivideVO {
	//	Main
	private String cs_func_id = "";
	private String title = "";
	private String detail = "";
	private String url = "";
	private int ver = 0;
	private int cnt = 0;
	private int cs_like = 0;
	private String filepath = "";
	private String delyn = "";
	private String create_dt = "";
	private String create_user = "";
	private String update_dt = "";
	private String update_user = "";
	private String own	= "";
	private String nickname = "";
	
	//	코드 미러
	private String cs_html = "";
	private String cs_css = "";
	private String cs_js = "";
	private String cs_other = "";
	private String cs_etc = "";
	private String cs_lib = "";
	
	// 좋아요 관리
	private String like_title = "";
	private String like_email = "";
	private String like_nickname = "";
	private String like_like = "";
	private String like_create_dt = "";
	
	// 커뮤니티 관리
	private String com_count = "";
	private String com_title = "";
 	private String com_detail = "";
	private String com_nickname = "";
	private int com_cnt = 0;
	private int com_like = 0;
	private String com_create_dt = "";
	private String com_update_dt = "";
	
	// 커뮤니티 추천 관리
	private String recommen_number = "";
	private String recommen_title = "";
	private String recommen_detail = "";
	private String recommen_nickname = "";
	private String recommen_create_dt = "";
	
	// 히스토리 관리
	private String  history_id = "";			
	private String  history_title = ""; 		
	private String  history_detail = ""; 		
	private String  history_filepath = "";	
	private String  history_nickname = "";	
	private int  history_ver = 0;
	private String  history_create_dt = ""; 	
	private String  history_update_dt = "";	
	
	public String getHistory_id() {
		return history_id;
	}
	public void setHistory_id(String history_id) {
		this.history_id = history_id;
	}
	public String getHistory_title() {
		return history_title;
	}
	public void setHistory_title(String history_title) {
		this.history_title = history_title;
	}
	public String getHistory_detail() {
		return history_detail;
	}
	public void setHistory_detail(String history_detail) {
		this.history_detail = history_detail;
	}
	public String getHistory_filepath() {
		return history_filepath;
	}
	public void setHistory_filepath(String history_filepath) {
		this.history_filepath = history_filepath;
	}
	public String getHistory_nickname() {
		return history_nickname;
	}
	public void setHistory_nickname(String history_nickname) {
		this.history_nickname = history_nickname;
	}
	public int getHistory_ver() {
		return history_ver;
	}
	public void setHistory_ver(int history_ver) {
		this.history_ver = history_ver;
	}
	public String getHistory_create_dt() {
		return history_create_dt;
	}
	public void setHistory_create_dt(String history_create_dt) {
		this.history_create_dt = history_create_dt;
	}
	public String getHistory_update_dt() {
		return history_update_dt;
	}
	public void setHistory_update_dt(String history_update_dt) {
		this.history_update_dt = history_update_dt;
	}
	
	public String getRecommen_number() {
		return recommen_number;
	}
	public void setRecommen_number(String recommen_number) {
		this.recommen_number = recommen_number;
	}
	public String getRecommen_title() {
		return recommen_title;
	}
	public void setRecommen_title(String recommen_title) {
		this.recommen_title = recommen_title;
	}
	public String getRecommen_detail() {
		return recommen_detail;
	}
	public void setRecommen_detail(String recommen_detail) {
		this.recommen_detail = recommen_detail;
	}
	public String getRecommen_nickname() {
		return recommen_nickname;
	}
	public void setRecommen_nickname(String recommen_nickname) {
		this.recommen_nickname = recommen_nickname;
	}
	public String getRecommen_create_dt() {
		return recommen_create_dt;
	}
	public void setRecommen_create_dt(String recommen_create_dt) {
		this.recommen_create_dt = recommen_create_dt;
	}
	public String getCom_count() {
		return com_count;
	}
	public void setCom_count(String com_count) {
		this.com_count = com_count;
	}
	public String getCom_title() {
		return com_title;
	}
	public void setCom_title(String com_title) {
		this.com_title = com_title;
	}
	public String getCom_detail() {
		return com_detail;
	}
	public void setCom_detail(String com_detail) {
		this.com_detail = com_detail;
	}
	public String getCom_nickname() {
		return com_nickname;
	}
	public void setCom_nickname(String com_nickname) {
		this.com_nickname = com_nickname;
	}
	
	public int getCom_cnt() {
		return com_cnt;
	}
	public void setCom_cnt(int com_cnt) {
		this.com_cnt = com_cnt;
	}
	public int getCom_like() {
		return com_like;
	}
	public void setCom_like(int com_like) {
		this.com_like = com_like;
	}
	public String getCom_create_dt() {
		return com_create_dt;
	}
	public void setCom_create_dt(String com_create_dt) {
		this.com_create_dt = com_create_dt;
	}
	public String getCom_update_dt() {
		return com_update_dt;
	}
	public void setCom_update_dt(String com_update_dt) {
		this.com_update_dt = com_update_dt;
	}
	public String getLike_email() {
		return like_email;
	}
	public void setLike_email(String like_email) {
		this.like_email = like_email;
	}
	
	public String getLike_nickname() {
		return like_nickname;
	}
	public void setLike_nickname(String like_nickname) {
		this.like_nickname = like_nickname;
	}
	public String getLike_like() {
		return like_like;
	}
	public void setLike_like(String like_like) {
		this.like_like = like_like;
	}
	public String getLike_create_dt() {
		return like_create_dt;
	}
	public void setLike_create_dt(String like_create_dt) {
		this.like_create_dt = like_create_dt;
	}
	
	public String getLike_title() {
		return like_title;
	}
	public void setLike_title(String like_title) {
		this.like_title = like_title;
	}
	public String getCs_html() {
		return cs_html;
	}
	public void setCs_html(String cs_html) {
		this.cs_html = cs_html;
	}
	public String getCs_css() {
		return cs_css;
	}
	public void setCs_css(String cs_css) {
		this.cs_css = cs_css;
	}
	public String getCs_js() {
		return cs_js;
	}
	public void setCs_js(String cs_js) {
		this.cs_js = cs_js;
	}
	public String getCs_other() {
		return cs_other;
	}
	public void setCs_other(String cs_other) {
		this.cs_other = cs_other;
	}
	public String getCs_etc() {
		return cs_etc;
	}
	public void setCs_etc(String cs_etc) {
		this.cs_etc = cs_etc;
	}
	public String getCs_lib() {
		return cs_lib;
	}
	public void setCs_lib(String cs_lib) {
		this.cs_lib = cs_lib;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getOwn() {
		return own;
	}
	public void setOwn(String own) {
		this.own = own;
	}
	public String getCs_func_id() {
		return cs_func_id;
	}
	public void setCs_func_id(String cs_func_id) {
		this.cs_func_id = cs_func_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public int getCs_like() {
		return cs_like;
	}
	public int getVer() {
		return ver;
	}
	public void setVer(int ver) {
		this.ver = ver;
	}
	public void setCs_like(int cs_like) {
		this.cs_like = cs_like;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	public String getCreate_dt() {
		return create_dt;
	}
	public void setCreate_dt(String create_dt) {
		this.create_dt = create_dt;
	}
	public String getCreate_user() {
		return create_user;
	}
	public void setCreate_user(String create_user) {
		this.create_user = create_user;
	}
	public String getUpdate_dt() {
		return update_dt;
	}
	public void setUpdate_dt(String update_dt) {
		this.update_dt = update_dt;
	}
	public String getUpdate_user() {
		return update_user;
	}
	public void setUpdate_user(String update_user) {
		this.update_user = update_user;
	}

	@Override
	public String toString() {
		return "DivideVO [cs_func_id=" + cs_func_id + ", title=" + title + ", detail=" + detail + ", url=" + url
				+ ", ver=" + ver + ", cnt=" + cnt + ", cs_like=" + cs_like + ", filepath=" + filepath + ", delyn="
				+ delyn + ", create_dt=" + create_dt + ", create_user=" + create_user + ", update_dt=" + update_dt
				+ ", update_user=" + update_user + ", own=" + own + ", nickname=" + nickname + ", cs_html=" + cs_html
				+ ", cs_css=" + cs_css + ", cs_js=" + cs_js + ", cs_other=" + cs_other + ", cs_etc=" + cs_etc
				+ ", cs_lib=" + cs_lib + ", like_title=" + like_title + ", like_email=" + like_email
				+ ", like_nickname=" + like_nickname + ", like_like=" + like_like + ", like_create_dt=" + like_create_dt
				+ ", com_count=" + com_count + ", com_title=" + com_title + ", com_detail=" + com_detail
				+ ", com_nickname=" + com_nickname + ", com_cnt=" + com_cnt + ", com_like=" + com_like
				+ ", com_create_dt=" + com_create_dt + ", com_update_dt=" + com_update_dt + ", recommen_number="
				+ recommen_number + ", recommen_title=" + recommen_title + ", recommen_detail=" + recommen_detail
				+ ", recommen_nickname=" + recommen_nickname + ", recommen_create_dt=" + recommen_create_dt
				+ ", history_id=" + history_id + ", history_title=" + history_title + ", history_detail="
				+ history_detail + ", history_filepath=" + history_filepath + ", history_nickname=" + history_nickname
				+ ", history_ver=" + history_ver + ", history_create_dt=" + history_create_dt + ", history_update_dt="
				+ history_update_dt + "]";
	}
	
}
