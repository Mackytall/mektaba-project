Map<String, String> getAuthHeaders(String token) => {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    };

Map<String, String> getHeaders() => {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
