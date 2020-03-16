DATA_ATUAL="$(date +%Y%m%d)"

function deleteOldBackup(){
	BACKUP_FOLDER=$1
	OLD_DATE="$(date +%Y%m%d -d '-3 days' )"
	for file in "${BACKUP_FOLDER}"/* 
	do
		backup_name=(${file//./ })
		if [ ${backup_name[1]} -lt ${OLD_DATE} ];
		then 
			rm ${file}
		fi
	done
}

function compressDirectory() {
	DIRECTORY_NAME=$1
	echo "Compactando a pasta ${DIRECTORY_NAME} em ${DIRECTORY_NAME}.${DATA_ATUAL}.tar.gz."
	tar -zcf "${DIRECTORY_NAME}.${DATA_ATUAL}.tar.gz" -C "${DIRECTORY_NAME}" .
}

function sendFilesToBackupFolder() {
	DIRECTORY_NAME=$1
	BACKUP_FOLDER=$2
	echo "Enviando arquivos para ${BACKUP_FOLDER}..."
	mv "${DIRECTORY_NAME}.${DATA_ATUAL}.tar.gz" ${BACKUP_FOLDER}
}
	
function Main() {
	DIRECTORY_NAME=$1
	BACKUP_FOLDER=$2
	echo "Iniciando backup do ${DIRECTORY_NAME}."

	deleteOldBackup ${BACKUP_FOLDER}
	compressDirectory ${DIRECTORY_NAME}
	sendFilesToBackupFolder ${DIRECTORY_NAME} ${BACKUP_FOLDER}
	
}
