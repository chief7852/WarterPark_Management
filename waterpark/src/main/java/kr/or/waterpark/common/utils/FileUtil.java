package kr.or.waterpark.common.utils;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 * IO 클래스 FileInputStream, FileOutputStream -> 기본 : byte, byte[] FileReader,
 * FileWriter -> 기본 : char, String DataInputStream, DataOutputStream -> 기본형,
 * byte ObjectInputStream, ObjectOutputStream -> 기본형, byte, 객체
 * 
 * IO 보조클래스 BufferdInputStream, BufferdOutputStream : flush() BufferdReader,
 * BufferdWriter : flush() InputStreamReader, OutputStreamReader
 * 
 */
public class FileUtil {
	/** 파일경로 --> 파일의 내용을 반환하는 함수 */
	public static StringBuffer read(String path) {

		StringBuffer sb = new StringBuffer();
		try (BufferedReader br = new BufferedReader(new FileReader(path));) {
			boolean isFirstLine = true;
			while (true) {
				String readLine = br.readLine();
				if (readLine == null) {
					break;
				}

				/** 이구간은 사용자가 알아서 처리하도록 하기 위한 로직 처리 */
				System.out.println(readLine);
				if (isFirstLine) {
					sb.append(readLine);
					isFirstLine = false;
				} else {
					sb.append("\r\n" + readLine);
				}
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sb;
	}

	public static interface IRead {
		public void read(String readLine); /** 알아서 처리하도록 파라미터만 부여한 함수 정의 */
	}

	/**
	 * 파일경로 --> 파일의 내용을 반환하는 함수(대용량) -> 파일경로를 주면 한줄씩 읽어서 처리할 수 있는 타입을 파라미터로 전달
	 */
	public static void read(String path, IRead iRead) {

		try (BufferedReader br = new BufferedReader(new FileReader(path));) {
			boolean isFirstLine = true;
			while (true) {
				String readLine = br.readLine();
				if (readLine == null) {
					break;
				}

				/*******************************************************/
				/** 이구간은 사용자가 알아서 처리하도록 하기 위한 로직 처리 : readLine */
				iRead.read(readLine);
				/*******************************************************/
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/** 사용자가 작업하는 구간 */
	public static void main(String[] args) {
		// StringBuffer sb = read("src/valion/test/java/FileUtil.java");
		// System.out.println(sb);

		read("src/valion/test/java/FileUtil.java", new IRead() {
			@Override
			public void read(String readLine) {
				System.out.println(readLine);
			}
		});

		read("src/valion/test/java/FileUtil.java", (String readLine) -> {
			System.out.println(readLine);
		});

//		read("경로", new 반환타입() {
//			public void read(String readLine) {
//				/** 한줄씩 줄테니 여기서 작업해 */ 
//			}
//		});
	}

	public static class 반환타입 {

	}

}
