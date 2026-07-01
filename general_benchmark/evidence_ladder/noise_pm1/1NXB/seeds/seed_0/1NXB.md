# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1NXB\sequence\1NXB.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1NXB\seeds\seed_0\1NXB.pdb`
- residues: 60
- mode: oracle
- ca_rmsd: 1.100 A
- tm_score_ca_ordered: 0.8909492764216923
- heavy_atom_rmsd: 3.205 A
- sidechain_heavy_atom_rmsd: 4.114 A
- **all-atom quality (honest):** heavy 3.205 A, sidechain 4.114 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 1653
- bin_accuracy: 0.661

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.1004103369419131
- ga_delta_rmsd: 0.11515317406691761  ga_fitness_mode: energy
- pre_local_rmsd: 1.108514339656125  localized_anchor_rmsd: 1.1004249958747927

## Failure Classification

- primary_reason: `BACKBONE_NEAR_MISS_LT_1A`
- reasons: `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** N4-Q5 → 19 conflicts (41%); S29 → 8 conflicts (17%); Y24 → 7 conflicts (15%)
- explained: 34/46 conflicts by 3 root cause(s)
- metrics: hubs=19 (frac 0.317), conflicts/hub=2.4, max_incompat=3.84Å, chain_span=0.983
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): N4-Q5 + S29 + Y24 — explain ~34/46 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S8** — severity 6.39, 6 conflict(s); suspect input ~`N4` (group: pull_in)
  - pull-in (wants closer): N4@6.6Å(now 9.3,conf 0.39)
  - S17↔N4: targets 22.6/6.6Å but partners are 12.6Å apart → too_close_together by 3.5Å
  - P18↔N4: targets 25.5/6.6Å but partners are 15.5Å apart → too_close_together by 3.4Å
  - C16↔N4: targets 19.5/6.6Å but partners are 9.6Å apart → too_close_together by 3.3Å
- **N4** — severity 4.57, 7 conflict(s); suspect input ~`S17` (group: push_out)
  - pull-in (wants closer): S8@6.6Å(now 9.3,conf 0.39)
  - push-out (wants farther): P18@18.2Å(now 15.5,conf 0.37)
  - S8↔S17: targets 6.6/13.1Å but partners are 21.9Å apart → too_far_apart by 2.2Å
  - G19↔S8: targets 16.9/6.6Å but partners are 25.5Å apart → too_far_apart by 2.0Å
  - S8↔C40: targets 6.6/7.5Å but partners are 15.9Å apart → too_far_apart by 1.9Å
- **S29** — severity 3.65, 4 conflict(s); suspect input ~`N60` (group: pull_in)
  - pull-in (wants closer): G19@27.4Å(now 30.0,conf 0.94), N60@15.0Å(now 17.8,conf 0.34)
  - V58↔N60: targets 23.8/15.0Å but partners are 5.5Å apart → too_close_together by 3.4Å
  - C59↔N60: targets 22.3/15.0Å but partners are 4.2Å apart → too_close_together by 3.0Å
  - S56↔N60: targets 26.3/15.0Å but partners are 8.8Å apart → too_close_together by 2.5Å
- **Y24** — severity 3.26, 4 conflict(s); suspect input ~`G19` (group: push_out)
  - push-out (wants farther): G19@17.9Å(now 15.2,conf 0.36), W28@16.8Å(now 12.8,conf 0.35)
  - G41↔G19: targets 4.7/17.9Å but partners are 10.7Å apart → too_close_together by 2.5Å
  - L51↔W28: targets 6.2/16.8Å but partners are 8.1Å apart → too_close_together by 2.5Å
  - W28↔Q27: targets 16.8/10.5Å but partners are 3.9Å apart → too_close_together by 2.3Å
- **H25** — severity 2.14, 3 conflict(s); suspect input ~`Q5` (group: pull_in)
  - pull-in (wants closer): Q5@8.0Å(now 10.5,conf 0.35)
  - S52↔Q5: targets 5.0/8.0Å but partners are 15.5Å apart → too_far_apart by 2.6Å
  - C53↔Q5: targets 6.0/8.0Å but partners are 15.7Å apart → too_far_apart by 1.8Å
  - P10↔Q5: targets 16.6/8.0Å but partners are 6.9Å apart → too_close_together by 1.8Å
- **S56** — severity 1.92, 2 conflict(s); suspect input ~`C53` (group: push_out)
  - pull-in (wants closer): F31@27.5Å(now 31.0,conf 0.99), R32@27.2Å(now 29.9,conf 0.89)
  - push-out (wants farther): V45@21.0Å(now 18.0,conf 0.44), C23@9.3Å(now 6.4,conf 0.34)
  - V45↔C53: targets 21.0/7.7Å but partners are 9.5Å apart → too_close_together by 3.8Å
  - V45↔C42: targets 21.0/12.0Å but partners are 7.4Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=22 · 3-10(G)=14 · coil(C)=14

```
CEGHEEHGEGCEEECGCCGCHEGEGGEEGEHCEHCHGEECCEEGGEGHCHCECECEGHHE
```

## Backbone H-bond Network

- total=44 · helix(i→i+4)=0 · sheet=44
  - C2 ↔ T12  (sheet)
  - C2 ↔ T13  (sheet)
  - C2 ↔ K14  (sheet)
  - C2 ↔ S22  (sheet)
  - Q5 ↔ T12  (sheet)
  - Q5 ↔ T13  (sheet)
  - Q5 ↔ K14  (sheet)
  - Q5 ↔ Y24  (sheet)
  - H6 ↔ T12  (sheet)
  - H6 ↔ T13  (sheet)
  - H6 ↔ K14  (sheet)
  - H6 ↔ Y24  (sheet)
  - T13 ↔ Y24  (sheet)
  - K14 ↔ Y24  (sheet)
  - S22 ↔ R38  (sheet)
  - S22 ↔ G39  (sheet)
  - S22 ↔ C42  (sheet)
  - Y24 ↔ R38  (sheet)
  - Y24 ↔ G39  (sheet)
  - Y24 ↔ C42  (sheet)
  - … +24 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=21 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=215 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=135 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.04 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
