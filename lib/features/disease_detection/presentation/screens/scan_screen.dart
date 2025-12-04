import 'package:flutter/material.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Plant'), elevation: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: 64,
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No image selected',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  // Handle camera
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text('Take Photo'),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () {
                  // Handle gallery
                },
                icon: const Icon(Icons.image),
                label: const Text('Choose from Gallery'),
              ),
              const SizedBox(height: 32),
              const Text(
                'Select Crop Type',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                items: const [
                  DropdownMenuItem(value: 'tomato', child: Text('Tomato')),
                  DropdownMenuItem(value: 'potato', child: Text('Potato')),
                  DropdownMenuItem(value: 'maize', child: Text('Maize')),
                  DropdownMenuItem(value: 'beans', child: Text('Beans')),
                  DropdownMenuItem(value: 'rice', child: Text('Rice')),
                  DropdownMenuItem(value: 'coffee', child: Text('Coffee')),
                ],
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: 'Select a crop',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/scan-result',
                    arguments: {
                      'scanData': {'crop': 'Tomato', 'diseases': []},
                    },
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text('Analyze Image'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScanResultScreen extends StatelessWidget {
  final Map<String, dynamic> scanData;

  const ScanResultScreen({Key? key, required this.scanData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Results'), elevation: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.image, size: 64, color: Colors.grey.shade500),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  border: Border.all(color: Colors.green.shade200),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Plant Health Status',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 12),
                    const Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green),
                        SizedBox(width: 12),
                        Text('Plant appears healthy'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Recommendations',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('• Maintain proper watering schedule'),
                    SizedBox(height: 8),
                    Text('• Ensure adequate sunlight exposure'),
                    SizedBox(height: 8),
                    Text('• Monitor soil nutrient levels'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamed('/history');
                },
                icon: const Icon(Icons.save),
                label: const Text('Save Result'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
