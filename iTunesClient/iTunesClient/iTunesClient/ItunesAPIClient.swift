//
//  ItunesAPIClient.swift
//  iTunesClient
//
//  Created by Ievgeniia Bondini on 4/11/19.
//  Copyright © 2019 Treehouse Island. All rights reserved.
//

import Foundation


class ITunesAPIClient {
    
    
    let downloader = JSONDownloader()
    
    func searchForArtist(withTerm term: String, completion: @escaping ([Artist], ItunesError?) -> Void) {
        let endpoint = Itunes.search(term: term, media: .music(entity: MusicEntity.musicArtist, attribute: .artistTerm))
        
        performRequest(with: endpoint) { result, error in
            guard let result = result else {
                completion([], error)
                return
            }
            
            let artists = result.flatMap{ Artist(json: $0)}
            completion(artists, nil)
        }
    }
    
    
    
    func lookupArtists(withId id: Int, completion: @escaping (Artist?, ItunesError?)->Void ) {
        
        let endpoint = Itunes.lookup(id: id, entity: MusicEntity.album)
        performRequest(with: endpoint) { result, error in
            guard let result = result else {
                completion(nil, error)
                return
            }
            guard let artistInfo = result.first else {
                completion(nil, ItunesError.jsonParsingFailure(message: "Results does not contain info"))
                return
            }
            guard let artist  = Artist(json: artistInfo) else {
                completion(nil, ItunesError.jsonParsingFailure(message: "Could not parse the information"))
                return
            }
            let albumResults = result[1..<result.count]
            let albums = albumResults.flatMap{
                Album(json: $0)
            }
            artist.albums = albums
            completion(artist, nil)
            
            
        }
    }
    
    func lookupAlbum(withId id: Int, completion: @escaping (Album?, ItunesError?)->Void ) {
        
        let endpoint = Itunes.lookup(id: id, entity: MusicEntity.song)
        performRequest(with: endpoint) { result, error in
            guard let result = result else {
                completion(nil, error)
                return
            }
            guard let albumInfo = result.first else {
                completion(nil, ItunesError.jsonParsingFailure(message: "Results does not contain album info"))
                return
            }
            guard let album  = Album(json: albumInfo) else {
                completion(nil, ItunesError.jsonParsingFailure(message: "Could not parse the information"))
                return
            }
            let songResults = result[1..<result.count]
            let songs = songResults.flatMap{
                Song(json: $0)
            }
            album.songs = songs
            completion(album, nil)
            
            
        }
    }
    
        
    
    
    typealias Result = [[String:Any]]
    private func performRequest(with endpoint: EndPoint, completion: @escaping(Result?, ItunesError?) -> Void) {
        let task = downloader.jsonTask(with: endpoint.request) {json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    completion(nil, ItunesError.requestFailed)
                    return
                }

                guard let result = json["results"] as? [[String:Any]] else {
                    completion(nil, ItunesError.jsonParsingFailure(message: "JSON data does not contain results"))
                    return
                }


                completion(result, nil)


            }
        }
        
        task.resume()
    }
}
