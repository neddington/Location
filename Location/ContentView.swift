//
//  ContentView.swift
//  Location
//
//  Created by Eddington, Nick on 11/20/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 47.7623, longitude: -122.2054),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    
    
    let bothellLocation = CLLocationCoordinate2D(latitude: 47.7623, longitude: -122.2054)
    let markerLocation = CLLocationCoordinate2D(latitude: 47.7608, longitude: -122.2063)
    let pinLocation = CLLocationCoordinate2D(latitude: 47.7585, longitude: -122.1907)
    let collegeLocation = CLLocationCoordinate2D(latitude: 47.7398, longitude: -122.1790)
    
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: [
            AnnotationItem(coordinate: markerLocation, title: "Marker Location"),
            AnnotationItem(coordinate: pinLocation, title: "Pin Location"),
            AnnotationItem(coordinate: collegeLocation, title: "Cascadia College")
        ]) { item in
            MapMarker(coordinate: item.coordinate, tint: .blue)
            // You can add a callout here if needed
        }
        .onAppear {
            region.center = bothellLocation
        }
    }
}

struct AnnotationItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
}


#Preview {
    ContentView()
}
