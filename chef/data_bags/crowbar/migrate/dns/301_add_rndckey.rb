def upgrade(template_attrs, template_deployment, attrs, deployment)
  deployment["designate_rndc_key"] = template_deployment["designate_rndc_key"]
  deployment["enable_designate"] = template_deployment["enable_designate"]
  return attrs, deployment
end

def downgrade(template_attrs, template_deployment, attrs, deployment)
  attr.delete("designate_rndc_key") unless template_attrs.key("designate_rndc_key")
  attr.delete("enable_designate") unless template_attrs.key("enable_designate")
  return attrs, deployment
end
