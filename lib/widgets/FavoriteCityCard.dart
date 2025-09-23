import 'package:flutter/material.dart';

class FavoriteCityCard extends StatelessWidget {
  final String city;
  final dynamic temperature;
  final String observationTime;
  final String weatherDescription;
  final String weatherIcon;
  final TextEditingController noteController;
  final VoidCallback onUpdateNote;
  final VoidCallback onRemove;

  const FavoriteCityCard({
    super.key,
    required this.city,
    required this.temperature,
    required this.observationTime,
    required this.weatherDescription,
    required this.weatherIcon,
    required this.noteController,
    required this.onUpdateNote,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (weatherIcon.isNotEmpty)
                  Image.network(
                    weatherIcon,
                    width: 50,
                    height: 50,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.image_not_supported, size: 50),
                  ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        city,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$temperature°C',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        weatherDescription,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Last updated: $observationTime',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: onRemove,
                ),
              ],
            ),
            const Divider(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Notes:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: noteController,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Add your notes about this city...",
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: onUpdateNote,
                    child: const Text("Save Note"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
