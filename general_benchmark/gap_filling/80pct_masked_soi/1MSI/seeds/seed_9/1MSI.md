# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1MSI\sequence\1MSI.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1MSI\seeds\seed_9\1MSI.pdb`
- residues: 64
- mode: oracle
- ca_rmsd: 2.768 A
- tm_score_ca_ordered: 0.5934984394979435
- heavy_atom_rmsd: 4.357 A
- sidechain_heavy_atom_rmsd: 5.620 A
- **all-atom quality (honest):** heavy 4.357 A, sidechain 5.620 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/54 (0.0)
- lj_severe: 0
- lj_near: 4
- distogram_pairs: 614
- bin_accuracy: 0.583

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.7679557602839893
- ga_delta_rmsd: 3.127528663432877  ga_fitness_mode: energy
- pre_local_rmsd: 2.8599461921545815  localized_anchor_rmsd: 2.7678748085535174

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** M56-Y63 → 24 conflicts (56%); T18-L19 → 15 conflicts (35%)
- explained: 39/43 conflicts by 2 root cause(s)
- metrics: hubs=17 (frac 0.266), conflicts/hub=2.5, max_incompat=4.36Å, chain_span=0.922
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): M56-Y63 + T18-L19 — explain ~39/43 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **M56** — severity 10.92, 9 conflict(s); suspect input ~`A1` (group: pull_in)
  - pull-in (wants closer): A1@17.0Å(now 20.9,conf 0.55), A34@11.3Å(now 15.4,conf 0.55), S24@12.7Å(now 16.6,conf 0.55), V26@13.7Å(now 17.3,conf 0.55), R39@13.7Å(now 16.5,conf 0.55)
  - M59↔A1: targets 5.4/17.0Å but partners are 25.8Å apart → too_far_apart by 3.4Å
  - M59↔V26: targets 5.4/13.7Å but partners are 21.7Å apart → too_far_apart by 2.6Å
  - K61↔A1: targets 11.0/17.0Å but partners are 30.4Å apart → too_far_apart by 2.4Å
- **I32** — severity 6.69, 5 conflict(s); suspect input ~`D58` (group: pull_in)
  - pull-in (wants closer): D58@9.6Å(now 13.3,conf 0.55), V60@9.7Å(now 12.4,conf 0.55)
  - A1↔V60: targets 13.4/9.7Å but partners are 25.9Å apart → too_far_apart by 2.8Å
  - D36↔D58: targets 7.0/9.6Å but partners are 19.2Å apart → too_far_apart by 2.6Å
  - E35↔D58: targets 8.0/9.6Å but partners are 20.2Å apart → too_far_apart by 2.6Å
- **S42** — severity 6.66, 5 conflict(s); suspect input ~`S4` (group: pull_in)
  - pull-in (wants closer): T18@6.2Å(now 10.3,conf 0.55)
  - T18↔S4: targets 6.2/17.9Å but partners are 8.7Å apart → too_close_together by 3.0Å
  - T18↔P33: targets 6.2/16.7Å but partners are 7.7Å apart → too_close_together by 2.8Å
  - T18↔R23: targets 6.2/15.3Å but partners are 6.7Å apart → too_close_together by 2.4Å
- **P57** — severity 6.37, 4 conflict(s); suspect input ~`Q2` (group: push_out)
  - pull-in (wants closer): A1@18.9Å(now 23.1,conf 0.56), Q2@15.5Å(now 20.5,conf 0.55), P38@14.5Å(now 17.1,conf 0.55), I37@11.9Å(now 14.6,conf 0.55)
  - push-out (wants farther): G62@9.0Å(now 6.5,conf 0.94)
  - K61↔Q2: targets 9.0/15.5Å but partners are 27.7Å apart → too_far_apart by 3.2Å
  - Y63↔Q2: targets 6.2/15.5Å but partners are 24.9Å apart → too_far_apart by 3.2Å
  - A1↔Y63: targets 18.9/6.2Å but partners are 27.7Å apart → too_far_apart by 2.7Å
- **L19** — severity 5.85, 2 conflict(s); suspect input ~`A16` (group: push_out)
  - push-out (wants farther): I13@17.0Å(now 13.8,conf 0.99), N14@17.0Å(now 13.7,conf 0.99), R23@7.1Å(now 4.6,conf 0.91), V26@17.1Å(now 14.1,conf 0.91), M22@5.7Å(now 2.5,conf 0.55), G31@16.9Å(now 12.3,conf 0.55), S24@11.0Å(now 7.9,conf 0.55), V6@11.4Å(now 8.6,conf 0.55), E25@14.6Å(now 10.9,conf 0.55)
  - N14↔A16: targets 17.0/9.4Å but partners are 3.2Å apart → too_close_together by 4.4Å
  - I13↔A16: targets 17.0/9.4Å but partners are 4.5Å apart → too_close_together by 3.1Å
- **A34** — severity 3.15, 2 conflict(s); suspect input ~`T18` (group: push_out)
  - pull-in (wants closer): M56@11.3Å(now 15.4,conf 0.55), A64@14.4Å(now 17.6,conf 0.55)
  - push-out (wants farther): V20@13.6Å(now 10.7,conf 0.55), T18@14.0Å(now 6.9,conf 0.55)
  - I37↔T18: targets 7.0/14.0Å but partners are 3.8Å apart → too_close_together by 3.2Å
  - V5↔T18: targets 5.0/14.0Å but partners are 6.3Å apart → too_close_together by 2.6Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=24 · 3-10(G)=10 · coil(C)=10

```
CECECECHEGHHEGHHEGHHHEECECEEGCECCHHEHHHHEHEEGEEEHGGCEGEGHEHHHEGE
```

## Backbone H-bond Network

- total=49 · helix(i→i+4)=8 · sheet=41
  - N8 ↔ P12  (helix)
  - I11 ↔ T15  (helix)
  - P12 ↔ A16  (helix)
  - A16 ↔ V20  (helix)
  - A34 ↔ P38  (helix)
  - E35 ↔ R39  (helix)
  - P38 ↔ S42  (helix)
  - P57 ↔ K61  (helix)
  - S4 ↔ M22  (sheet)
  - S4 ↔ R23  (sheet)
  - V6 ↔ L17  (sheet)
  - V6 ↔ M22  (sheet)
  - V6 ↔ R23  (sheet)
  - V6 ↔ E25  (sheet)
  - Q9 ↔ L17  (sheet)
  - Q9 ↔ M22  (sheet)
  - Q9 ↔ R23  (sheet)
  - L17 ↔ M22  (sheet)
  - L17 ↔ R23  (sheet)
  - L17 ↔ D36  (sheet)
  - … +29 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=255 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=150 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.4515 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=4 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 54 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
