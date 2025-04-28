export EMAIL_REGEX='[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}'
export EMAIL_REGEX_POSIX='\b[[:alnum:]]._%+-]+@[[:alnum:]].-]+\.[[:alpha:]]{2,}\b'
export IP_REGEX='((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)'
export IPV4_REGEX='^((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9][0-9]|[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9][0-9]|[0-9])$'
export MAC_REGEX='([[:xdigit:]]{2}:){5}[[:xdigit:]]{2}'
export DATE_YYYYMMDD_REGEX='[0-9]{4}-[0-9]{2}-[0-9]{2}'
export URL_REGEX_POSIX="https?://[^[:space:]\"'<>()]+"
