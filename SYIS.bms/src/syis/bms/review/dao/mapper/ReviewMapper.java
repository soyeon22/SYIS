package syis.bms.review.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;

import syis.bms.review.domain.Review;

public interface ReviewMapper {
	//리뷰 가져오기
	//Param : 도서 코드
	//return : 리뷰 배열
	List<Review> getReviews(String bookCode);
	
	@Insert("insert into reviews values(reviewnum_seq.nextval, #{userId}, #{bookCode}, #{reviewContent}, sysdate, #{gpa})")
	int addReview(Review review);
}