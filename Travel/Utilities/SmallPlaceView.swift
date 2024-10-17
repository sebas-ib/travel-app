import SwiftUI

struct SmallPlaceView : View {
    let itinerary : Itinerary
    
    var body : some View {
        Text(itinerary.name)
            .font(.title)
            .fontWeight(.regular)
    }
}
struct SmallPlaceView_Previews: PreviewProvider {
    static var previews : some View{
        SmallPlaceView(itinerary: .preview())
    }
}
