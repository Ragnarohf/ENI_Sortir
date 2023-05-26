<?php

    namespace App\Test\Controller;

    use App\Entity\Campus;
    use App\Repository\CampusRepository;
    use Symfony\Bundle\FrameworkBundle\KernelBrowser;
    use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

    class CampusControllerTest extends WebTestCase
    {
        private KernelBrowser $client;
        private CampusRepository $repository;
        private string $path = '/campus/';

        public function testIndex(): void
        {
            $crawler = $this->client->request('GET', $this->path);

            self::assertResponseStatusCodeSame(200);
            self::assertPageTitleContains('Campus index');

            // Use the $crawler to perform additional assertions e.g.
            // self::assertSame('Some text on the page', $crawler->filter('.p')->first());
        }

        public function testNew(): void
        {
            $originalNumObjectsInRepository = count($this->repository->findAll());

            $this->markTestIncomplete();
            $this->client->request('GET', sprintf('%snew', $this->path));

            self::assertResponseStatusCodeSame(200);

            $this->client->submitForm('Save', [
                'campus[name]' => 'Testing',
            ]);

            self::assertResponseRedirects('/campus/');

            self::assertSame($originalNumObjectsInRepository + 1, count($this->repository->findAll()));
        }

        public function testShow(): void
        {
            $this->markTestIncomplete();
            $fixture = new Campus();
            $fixture->setName('My Title');

            $this->repository->save($fixture, true);

            $this->client->request('GET', sprintf('%s%s', $this->path, $fixture->getId()));

            self::assertResponseStatusCodeSame(200);
            self::assertPageTitleContains('Campus');

            // Use assertions to check that the properties are properly displayed.
        }

        public function testEdit(): void
        {
            $this->markTestIncomplete();
            $fixture = new Campus();
            $fixture->setName('My Title');

            $this->repository->save($fixture, true);

            $this->client->request('GET', sprintf('%s%s/edit', $this->path, $fixture->getId()));

            $this->client->submitForm('Update', [
                'campus[name]' => 'Something New',
            ]);

            self::assertResponseRedirects('/campus/');

            $fixture = $this->repository->findAll();

            self::assertSame('Something New', $fixture[0]->getName());
        }

        public function testRemove(): void
        {
            $this->markTestIncomplete();

            $originalNumObjectsInRepository = count($this->repository->findAll());

            $fixture = new Campus();
            $fixture->setName('My Title');

            $this->repository->save($fixture, true);

            self::assertSame($originalNumObjectsInRepository + 1, count($this->repository->findAll()));

            $this->client->request('GET', sprintf('%s%s', $this->path, $fixture->getId()));
            $this->client->submitForm('Delete');

            self::assertSame($originalNumObjectsInRepository, count($this->repository->findAll()));
            self::assertResponseRedirects('/campus/');
        }

        protected function setUp(): void
        {
            $this->client = static::createClient();
            $this->repository = static::getContainer()->get('doctrine')->getRepository(Campus::class);

            foreach ($this->repository->findAll() as $object) {
                $this->repository->remove($object, true);
            }
        }
    }
