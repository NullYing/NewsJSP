package bean;

public class New {
	private int id; // ID
	private String title; // 标题
	private String content; // 内容
	private String summary; // 摘要
	private String author; // 作者
	private String type; // 类别
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	private String posttime; // 时间

	public String getSummary() {
		summary = HtmlToText(content);
		if (summary.length() > 220) {
			summary = summary.substring(0, 220);
			summary = summary + "...";
		}
		return summary;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPosttime() {
		return posttime;
	}

	public void setPosttime(String posttime) {
		this.posttime = posttime;
	}

	public String HtmlToText(String content) {
		// TODO Auto-generated method stub
		String txtcontent = content.replaceAll("</?[^>]+>", ""); // 剔出<html>的标签
		txtcontent = txtcontent.replaceAll("<a>\\s*|\t|\r|\n</a>", "");// 去除字符串中的空格,回车,换行符,制表符
		return txtcontent;
	}
}
