(
  (block_mapping_pair
	key: (flow_node
	  (plain_scalar
		(string_scalar) @script_key
	  )
	)
	value: (block_node
	  (block_sequence
		(block_sequence_item
		  (flow_node
			(plain_scalar
			  (string_scalar) @injection.content
			)
		  )
		)
	  )
	)
  )
  (#any-of? @script_key "before_script" "script" "after_script")
  (#set! injection.language "bash")
)
