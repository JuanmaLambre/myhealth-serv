class AuthorizationStatus
	def self.values
		AuthorizationAdminStatus.values.merge({ cancel: 'Cancelado' })
	end
end