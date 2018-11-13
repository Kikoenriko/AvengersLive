package modelo.mongodb;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;

public class DAOIncidencia {

	private DBBroker db;
	private MongoCollection<Document> coleccion;

	public DAOIncidencia() {
		
		db = new DBBroker();
		coleccion = db.devolverColeccion("Incidencias");
	}
	
	public List<Document> consultarIncidenciasPropias(String idEmpleado) {
		List<Document> incidencias = new ArrayList<Document>();
		Document documento = new Document();
		MongoCursor<Document> elementos = db.documentosEnColeccion(coleccion);
		while(elementos.hasNext()) {
			documento = elementos.next();
			if(documento.get("idEmpleado").toString().equalsIgnoreCase(idEmpleado))
				incidencias.add(documento);
		}
		
		return incidencias;
		
	}
	
	public List<Document> consultarIncidenciasGestor(){
		List<Document> incidencias = new ArrayList<Document>();
		Document documento = new Document();
		MongoCursor<Document> elementos = db.documentosEnColeccion(coleccion);
		while(elementos.hasNext()) {
			documento = elementos.next();
			if(!documento.get("mensaje").toString().equalsIgnoreCase("Resuelta"))
				incidencias.add(documento);
		}
		return incidencias;		
	}
	
	//////////////////////////ANA///////////////////////////
	public void registrarIncidencia(Incidencia incidencia) {
		Document documento = new Document();
		db.insertarDocumento(coleccion, documento
				.append("idEmpleado", incidencia.getIdEmpleado())
				.append("tipo", incidencia.getTipo())
				.append("mensaje", incidencia.getMensaje())
				.append("fechaInicio", incidencia.getFechaInicio())
				.append("fechaFin", incidencia.getFechaFin())
				.append("comentario", incidencia.getComentario()));
	}
	
	public boolean comprobarIncidencia(String idEmpleado, String tipo, String mensaje) {
		Document documento = new Document();
		MongoCursor<Document> elementos = db.documentosEnColeccion(coleccion);
		while(elementos.hasNext()) {
			documento = elementos.next();
			/*
			if(documento.get("idEmpleado").toString().equalsIgnoreCase(idEmpleado))
				if(documento.get("tipo").toString().equalsIgnoreCase(tipo))
					return false;*/

		}
		return true;
	}
	
	public List<Document> IncidenciasEmpleado(String idEmpleado){
		List<Document> incidencias = new ArrayList<Document>();
		Document documento = new Document();
		MongoCursor<Document> elementos = db.documentosEnColeccion(coleccion);
		while(elementos.hasNext()) {
			documento = elementos.next();
			if(documento.get("idEmpleado").toString().equalsIgnoreCase(idEmpleado))
				incidencias.add(documento);
		}	
		return incidencias;
	}
	////////////////////////////////////////////////////////////////
	
}