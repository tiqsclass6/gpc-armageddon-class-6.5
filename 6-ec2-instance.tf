resource "aws_vpn_gateway" "this" {
  vpc_id          = aws_vpc.this.id
  amazon_side_asn = var.amazon_side_asn

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-vgw"
  })
}

resource "aws_customer_gateway" "this" {
  bgp_asn    = var.customer_bgp_asn
  ip_address = var.customer_gateway_ip
  type       = "ipsec.1"

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-cgw"
  })
}

resource "aws_vpn_connection" "this" {
  vpn_gateway_id      = aws_vpn_gateway.this.id
  customer_gateway_id = aws_customer_gateway.this.id
  type                = "ipsec.2"
  static_routes_only  = var.use_static_routes

  tags = merge(local.common_tags, {
    Name = "${var.name_prefix}-vpn"
  })
}

resource "aws_vpn_gateway_route_propagation" "public_rtb" {
  count          = var.use_static_routes ? 0 : 1
  vpn_gateway_id = aws_vpn_gateway.this.id
  route_table_id = aws_route_table.public.id
}

resource "aws_vpn_connection_route" "static" {
  count                  = var.use_static_routes ? 1 : 0
  vpn_connection_id      = aws_vpn_connection.this.id
  destination_cidr_block = var.onprem_route_cidr
}
