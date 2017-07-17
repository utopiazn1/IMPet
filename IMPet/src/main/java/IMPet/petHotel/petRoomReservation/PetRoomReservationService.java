package IMPet.petHotel.petRoomReservation;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import IMPet.module.CommandMap;

@Repository
public interface PetRoomReservationService {

	public Map<String, Object> searchDate(Map<String, Object> map) throws Exception;
	
	public void resInsert(Map<String, Object> map) throws Exception;
	
	public void resPayment(Map<String, Object> map) throws Exception;

	public void resDelete(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectUserList(String str) throws Exception;
	
	public List<Map<String, Object>> selectAllList() throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public Map<String, Object> selectOne(Map<String, Object> map) throws Exception;
	
	
	public void update(Map<String, Object> map) throws Exception;
	
	public void delete(Map<String, Object> map) throws Exception;



}
