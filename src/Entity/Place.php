<?php

namespace App\Entity;

use App\Repository\PlaceRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: PlaceRepository::class)]
class Place
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $name = null;

    #[ORM\Column(length: 255)]
    private ?string $street = null;

    #[ORM\Column]
    private ?float $latitude = null;

    #[ORM\Column]
    private ?float $longitude = null;

    #[ORM\ManyToOne(inversedBy: 'places')]
    #[ORM\JoinColumn(nullable: false)]
    private ?City $city = null;

    #[ORM\OneToMany(mappedBy: 'place', targetEntity: Travel::class, orphanRemoval: true)]
    private Collection $travelsPlace;



    public function __construct()
    {
        $this->travels = new ArrayCollection();
        $this->travelsPlace = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getStreet(): ?string
    {
        return $this->street;
    }

    public function setStreet(string $street): self
    {
        $this->street = $street;

        return $this;
    }

    public function getLatitude(): ?float
    {
        return $this->latitude;
    }

    public function setLatitude(float $latitude): self
    {
        $this->latitude = $latitude;

        return $this;
    }

    public function getLongitude(): ?float
    {
        return $this->longitude;
    }

    public function setLongitude(float $longitude): self
    {
        $this->longitude = $longitude;

        return $this;
    }

    public function getCity(): ?City
    {
        return $this->city;
    }

    public function setCity(?City $city): self
    {
        $this->city = $city;

        return $this;
    }

    /**
     * @return Collection<int, Travel>
     */
    public function getTravelsPlace(): Collection
    {
        return $this->travelsPlace;
    }

    public function addTravelsPlace(Travel $travelsPlace): self
    {
        if (!$this->travelsPlace->contains($travelsPlace)) {
            $this->travelsPlace->add($travelsPlace);
            $travelsPlace->setPlace($this);
        }

        return $this;
    }

    public function removeTravelsPlace(Travel $travelsPlace): self
    {
        if ($this->travelsPlace->removeElement($travelsPlace)) {
            // set the owning side to null (unless already changed)
            if ($travelsPlace->getPlace() === $this) {
                $travelsPlace->setPlace(null);
            }
        }

        return $this;
    }


}
