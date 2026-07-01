# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1MSI/sequence/1MSI.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1MSI/seeds/seed_1/1MSI.pdb`
- residues: 64
- mode: oracle
- ca_rmsd: 7.102 A
- tm_score_ca_ordered: 0.2554469979192161
- heavy_atom_rmsd: 8.049 A
- sidechain_heavy_atom_rmsd: 8.985 A
- **all-atom quality (honest):** heavy 8.049 A, sidechain 8.985 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/54 (0.0)
- lj_severe: 0
- lj_near: 42
- distogram_pairs: 378
- bin_accuracy: 0.368

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=6.888649126944155 -> 6.318132813852548 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.101661400102832
- ga_delta_rmsd: -0.9845652839827155  ga_fitness_mode: energy
- pre_local_rmsd: 7.101714450583749  localized_anchor_rmsd: 7.101714450583749

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E35-R39 → 75 conflicts (47%); P12-N14 → 37 conflicts (23%); N46-V49 → 13 conflicts (8%)
- explained: 125/159 conflicts by 3 root cause(s)
- metrics: hubs=41 (frac 0.641), conflicts/hub=3.9, max_incompat=10.77Å, chain_span=0.969
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E35-R39 + P12-N14 + N46-V49 — explain ~125/159 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **N14** — severity 33.41, 19 conflict(s); suspect input ~`V45` (group: pull_in)
  - pull-in (wants closer): V45@5.3Å(now 9.1,conf 0.56), N46@5.5Å(now 9.8,conf 0.56)
  - push-out (wants farther): Q2@27.3Å(now 19.9,conf 0.93), E35@22.1Å(now 18.4,conf 0.64), R39@16.8Å(now 9.2,conf 0.55), N8@16.5Å(now 11.1,conf 0.55), M22@15.5Å(now 11.3,conf 0.55)
  - V45↔R39: targets 5.3/16.8Å but partners are 5.5Å apart → too_close_together by 6.0Å
  - Q2↔V45: targets 27.3/5.3Å but partners are 16.4Å apart → too_close_together by 5.7Å
  - E35↔V45: targets 22.1/5.3Å but partners are 11.4Å apart → too_close_together by 5.5Å
- **G52** — severity 31.88, 12 conflict(s); suspect input ~`N8` (group: push_out)
  - push-out (wants farther): R39@19.6Å(now 11.8,conf 0.57), P38@18.8Å(now 9.6,conf 0.56), A1@17.4Å(now 14.8,conf 0.55), P29@12.9Å(now 8.6,conf 0.55), V26@11.7Å(now 7.7,conf 0.55), A34@14.0Å(now 6.2,conf 0.55)
  - A7↔P38: targets 5.1/18.8Å but partners are 4.8Å apart → too_close_together by 8.9Å
  - P38↔N8: targets 18.8/6.1Å but partners are 5.7Å apart → too_close_together by 7.0Å
  - A7↔R39: targets 5.1/19.6Å but partners are 7.9Å apart → too_close_together by 6.6Å
- **E35** — severity 18.78, 7 conflict(s); suspect input ~`P38` (group: pull_in)
  - pull-in (wants closer): P38@7.4Å(now 10.0,conf 0.55), A64@13.7Å(now 17.3,conf 0.55)
  - push-out (wants farther): N14@22.1Å(now 18.4,conf 0.64), A48@21.9Å(now 13.0,conf 0.63), R47@21.7Å(now 14.5,conf 0.62), T53@17.0Å(now 3.0,conf 0.55), P29@16.4Å(now 7.1,conf 0.55)
  - A48↔P38: targets 21.9/7.4Å but partners are 3.8Å apart → too_close_together by 10.8Å
  - N14↔P38: targets 22.1/7.4Å but partners are 8.5Å apart → too_close_together by 6.2Å
  - R47↔P38: targets 21.7/7.4Å but partners are 9.3Å apart → too_close_together by 5.0Å
- **N46** — severity 17.91, 11 conflict(s); suspect input ~`P38` (group: pull_in)
  - pull-in (wants closer): N14@5.5Å(now 9.8,conf 0.56), I13@5.6Å(now 8.5,conf 0.56)
  - push-out (wants farther): P38@18.3Å(now 8.0,conf 0.55), L40@12.9Å(now 8.9,conf 0.55), L17@11.1Å(now 7.6,conf 0.55)
  - P38↔V49: targets 18.3/8.8Å but partners are 3.8Å apart → too_close_together by 5.7Å
  - I13↔P38: targets 5.6/18.3Å but partners are 7.1Å apart → too_close_together by 5.6Å
  - N14↔P38: targets 5.5/18.3Å but partners are 8.5Å apart → too_close_together by 4.3Å
- **P12** — severity 16.91, 6 conflict(s); suspect input ~`R39` (group: push_out)
  - push-out (wants farther): D36@19.8Å(now 11.6,conf 0.57), R39@18.7Å(now 7.6,conf 0.55), I37@17.4Å(now 10.1,conf 0.55), A7@10.6Å(now 7.8,conf 0.55), M21@10.4Å(now 3.7,conf 0.55), V6@14.1Å(now 9.7,conf 0.55)
  - A48↔R39: targets 4.6/18.7Å but partners are 3.9Å apart → too_close_together by 10.2Å
  - A48↔D36: targets 4.6/19.8Å but partners are 10.3Å apart → too_close_together by 4.8Å
  - D36↔A7: targets 19.8/10.6Å but partners are 4.3Å apart → too_close_together by 4.9Å
- **P38** — severity 15.18, 6 conflict(s); suspect input ~`E35` (group: pull_in)
  - pull-in (wants closer): E35@7.4Å(now 10.0,conf 0.55)
  - push-out (wants farther): P50@20.3Å(now 6.4,conf 0.59), R47@19.9Å(now 9.3,conf 0.58), G52@18.8Å(now 9.6,conf 0.56), N46@18.3Å(now 8.0,conf 0.55), V49@18.2Å(now 3.8,conf 0.55), N8@15.0Å(now 5.7,conf 0.55), P57@14.5Å(now 10.2,conf 0.55), V20@11.7Å(now 8.4,conf 0.55), M21@11.8Å(now 5.3,conf 0.55)
  - G52↔E35: targets 18.8/7.4Å but partners are 4.1Å apart → too_close_together by 7.3Å
  - N46↔S42: targets 18.3/9.2Å but partners are 3.3Å apart → too_close_together by 5.9Å
  - R47↔S42: targets 19.9/9.2Å but partners are 5.5Å apart → too_close_together by 5.2Å

## Secondary Structure (DSSP-like)

- helix(H)=43 · strand(E)=11 · 3-10(G)=4 · coil(C)=6

```
CEGEHHHEHHHHHHHHHHHHHHEEHHEGHHHHHEECCHHHHHHHHHHHCEGCEHHGHHHHEHHC
```

## Backbone H-bond Network

- total=35 · helix(i→i+4)=20 · sheet=15
  - V5 ↔ Q9  (helix)
  - Q9 ↔ I13  (helix)
  - I11 ↔ T15  (helix)
  - P12 ↔ A16  (helix)
  - N14 ↔ T18  (helix)
  - T15 ↔ L19  (helix)
  - A16 ↔ V20  (helix)
  - T18 ↔ M22  (helix)
  - M21 ↔ E25  (helix)
  - M22 ↔ V26  (helix)
  - E25 ↔ P29  (helix)
  - P29 ↔ P33  (helix)
  - P38 ↔ S42  (helix)
  - R39 ↔ M43  (helix)
  - L40 ↔ Q44  (helix)
  - S42 ↔ N46  (helix)
  - M43 ↔ R47  (helix)
  - Q44 ↔ A48  (helix)
  - L55 ↔ M59  (helix)
  - M59 ↔ Y63  (helix)
  - … +15 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=468 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=319 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.9534 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=42 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 54 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
