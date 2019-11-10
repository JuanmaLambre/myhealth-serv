class AuthorizationAdminStatus
	def self.values
		{ 
			requested: 'Pedido', evaluation: 'En evaluación', declined: 'Rechazado', accepted: 'Aceptado'
		}
	end
end