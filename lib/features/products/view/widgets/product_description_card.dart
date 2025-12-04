import 'package:flutter/material.dart';

class ProductDescriptionCard extends StatelessWidget {
  const ProductDescriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            title: const Text(
              "Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            iconColor: Colors.grey[600],
            collapsedIconColor: Colors.grey[600],
            children: [
              const Text(
                "Elegant winter jacket for men with detachable hood - warm, practical and versatile for business or outdoor activities",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const ProductSpecRow(
                label: "Material",
                value: "Polyester fiber (Polyester)",
              ),
              const ProductSpecRow(
                label: "Composition",
                value: "100% Polyester fiber (Polyester)",
              ),
              const ProductSpecRow(label: "Length", value: "Regular"),
              const ProductSpecRow(
                label: "Sleeve Length",
                value: "Long Sleeve",
              ),
              const ProductSpecRow(
                label: "Sleeve Type",
                value: "Raglan Sleeves",
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ProductSpecRow extends StatelessWidget {
  final String label;
  final String value;

  const ProductSpecRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}

