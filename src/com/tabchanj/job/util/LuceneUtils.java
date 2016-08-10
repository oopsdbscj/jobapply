package com.tabchanj.job.util;

import java.io.File;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.wltea.analyzer.lucene.IKAnalyzer;

/**
 * Lucene通用工具
 * 
 * @author tab
 *
 */
public class LuceneUtils {
	// 创建索引库
	private static Directory directory = null;
	// 创建词法分析器
	private static Analyzer analyzer = new IKAnalyzer();
	// 创建索引写入器
	private static IndexWriter indexWriter = null;

	public static Analyzer getAnalyzer() {
		return analyzer;
	}

	/**
	 * 获取索引库文件路径
	 * 
	 * @return
	 */
	public static String getIndexPath() {
		StringBuilder pathname = new StringBuilder(Global.webAppPath);
		pathname.append("WEB-INF").append(File.separator).append("index").append(File.separator);
		return pathname.toString();
	}

	/**
	 * 获取索引库directory对象
	 * 
	 * @return
	 */
	public static Directory getDirectory() {
		try {
			if (directory == null) {
				directory = FSDirectory.open(new File(getIndexPath()));
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		return directory;
	}

	/**
	 * 获取indexWriter
	 * 
	 * @return
	 */
	public static IndexWriter getIndexWriter() {
		try {
			if (indexWriter == null) {
				synchronized (LuceneUtils.class) {
					if (indexWriter == null) {
						Version version = Version.LUCENE_4_10_4;
						indexWriter = new IndexWriter(getDirectory(), new IndexWriterConfig(version, getAnalyzer()));
					}
				}
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		return indexWriter;
	}

	/**
	 * 关闭indexWriter
	 */
	public static void closeIndexWriter() {
		try {
			if (indexWriter != null) {
				indexWriter.close();
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}

	}

}
