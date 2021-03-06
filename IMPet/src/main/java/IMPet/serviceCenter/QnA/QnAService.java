package IMPet.serviceCenter.QnA;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

@Repository
public interface QnAService {

	public List<Map<String, Object>> selectAll() throws Exception;

	public Map<String, Object> selectOne(Map<String, Object> map) throws Exception;

	public void insert(Map<String, Object> map) throws Exception;

	public void update(Map<String, Object> map) throws Exception;

	public void delete(Map<String, Object> map) throws Exception;
	
	public void insertRef(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> selectMy(String id) throws Exception;

	public void addViewNum(Map<String, Object> map) throws Exception;
	

}
