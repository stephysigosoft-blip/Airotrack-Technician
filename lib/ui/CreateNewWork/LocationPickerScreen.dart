import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/assets/resources/strings.dart';
import 'package:airotrackgit/ui/utils/Widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationPickerScreen extends StatefulWidget {
  final LatLng? initialLocation;

  const LocationPickerScreen({super.key, this.initialLocation});

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  GoogleMapController? mapController;
  LatLng? selectedLocation;
  bool isLoading = true;
  bool isGettingAddress = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialLocation != null) {
      // Use provided initial location
      selectedLocation = widget.initialLocation;
      isLoading = false;
      // Animate camera to the initial location
      WidgetsBinding.instance.addPostFrameCallback((_) {
        mapController?.animateCamera(
          CameraUpdate.newLatLng(widget.initialLocation!),
        );
      });
    } else {
      _getCurrentLocation();
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        selectedLocation = LatLng(position.latitude, position.longitude);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        selectedLocation = const LatLng(9.9312, 76.2673);
        isLoading = false;
      });
    }
  }

  void _onMapTap(LatLng position) {
    debugPrint("Map tapped at: ${position.latitude}, ${position.longitude}");
    setState(() {
      selectedLocation = position;
    });
    debugPrint(
        "Selected location updated to: ${selectedLocation!.latitude}, ${selectedLocation!.longitude}");
    // Animate camera to the new position
    mapController?.animateCamera(
      CameraUpdate.newLatLng(position),
    );
  }

  void _onConfirmSelection() async {
    setState(() {
      isGettingAddress = true;
    });

    try {
      // Get the center location from the camera position (where the icon points)
      LatLng locationToGeocode;

      if (mapController != null) {
        final cameraPosition = await mapController!.getVisibleRegion();
        final centerLat = (cameraPosition.northeast.latitude +
                cameraPosition.southwest.latitude) /
            2;
        final centerLng = (cameraPosition.northeast.longitude +
                cameraPosition.southwest.longitude) /
            2;
        locationToGeocode = LatLng(centerLat, centerLng);
        debugPrint("✓ Center location selected: $centerLat, $centerLng");

        // Update selected location
        setState(() {
          selectedLocation = locationToGeocode;
        });
      } else {
        locationToGeocode = selectedLocation!;
      }

      debugPrint(
          "✓ Geocoding location: ${locationToGeocode.latitude}, ${locationToGeocode.longitude}");
      List<Placemark> placemarks = await placemarkFromCoordinates(
        locationToGeocode.latitude,
        locationToGeocode.longitude,
      );

      debugPrint("Number of placemarks found: ${placemarks.length}");
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String address = _formatPlacemark(place);
        debugPrint("✓ SUCCESS - Address found: $address");
        debugPrint("✓ Street: ${place.street}");
        debugPrint("✓ Locality: ${place.locality}");
        debugPrint("✓ SubLocality: ${place.subLocality}");
        debugPrint("✓ AdministrativeArea: ${place.administrativeArea}");
        debugPrint("✓ Country: ${place.country}");
        debugPrint("latitude: ${locationToGeocode.latitude}");
        debugPrint("longitude: ${locationToGeocode.longitude}");

        setState(() {
          isGettingAddress = false;
        });

        Get.back(result: {
          'latitude': locationToGeocode.latitude.toString(),
          'longitude': locationToGeocode.longitude.toString(),
          'address': address,
        });
        return;
      }

      debugPrint("✗ No placemarks found");

      // Fallback if geocoding fails
      String address = "Selected Location";
      setState(() {
        isGettingAddress = false;
      });

      Get.back(result: {
        'latitude': locationToGeocode.latitude.toString(),
        'longitude': locationToGeocode.longitude.toString(),
        'address': address,
      });
    } catch (e) {
      debugPrint("✗ Error getting address: $e");
      // Fallback on error
      String address = "Selected Location";

      setState(() {
        isGettingAddress = false;
      });

      Get.back(result: {
        'latitude': selectedLocation!.latitude.toString(),
        'longitude': selectedLocation!.longitude.toString(),
        'address': address,
      });
    }
  }

  String _formatPlacemark(Placemark place) {
    List<String> addressParts = [];

    if (place.street != null && place.street!.isNotEmpty) {
      addressParts.add(place.street!);
    }
    if (place.subLocality != null && place.subLocality!.isNotEmpty) {
      addressParts.add(place.subLocality!);
    }
    if (place.locality != null && place.locality!.isNotEmpty) {
      addressParts.add(place.locality!);
    }
    if (place.administrativeArea != null &&
        place.administrativeArea!.isNotEmpty) {
      addressParts.add(place.administrativeArea!);
    }
    if (place.postalCode != null && place.postalCode!.isNotEmpty) {
      addressParts.add(place.postalCode!);
    }
    if (place.country != null && place.country!.isNotEmpty) {
      addressParts.add(place.country!);
    }

    if (addressParts.isEmpty) {
      return "Selected Location";
    }

    return addressParts.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar:
          CustomAppBar(title: Strings.createNewWork, onBack: () => Get.back()),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: selectedLocation!,
                    zoom: 15,
                  ),
                  onMapCreated: (controller) {
                    mapController = controller;
                  },
                  onTap: _onMapTap,
                  markers: {},
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                ),
                const IgnorePointer(
                  child: Center(
                    child: Icon(
                      Icons.location_on,
                      size: 50,
                      color: colorPrimary,
                    ),
                  ),
                ),
                Positioned(
                  bottom: media.height * 0.02,
                  left: media.width * 0.02,
                  right: media.width * 0.02,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorPrimary,
                      padding:
                          EdgeInsets.symmetric(vertical: media.height * 0.015),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: isGettingAddress ? null : _onConfirmSelection,
                    child: isGettingAddress
                        ? SizedBox(
                            height: media.height * 0.02,
                            width: media.width * 0.02,
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            Strings.selectThisLocation,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                  ),
                ),
              ],
            ),
    );
  }
}
