export EMAIL_REGEX='\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\b'
export EMAIL_REGEX_POSIX='\b[[:alnum:]_.%+-]+@[[:alnum:]_.-]+\.[[:alpha:]]{2,}\b'

export IP_REGEX='\b((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b'
export IPV4_REGEX='\b(?<![\d.])(?:(?:[1-9]?\d|1\d\d|2[0-4]\d|25[0-5])\.){3}(?:[1-9]?\d|1\d\d|2[0-4]\d|25[0-5])(?![\d.])\b'

export MAC_REGEX='\b([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})\b'

export URL_REGEX='^(https?|ftp)://[^\s/$.?#].[^\s]*$'
export URL_REGEX_POSIX="https?://[^[:space:]\"'<>()]+"
