# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1VII/sequence/1VII.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1VII/seeds/seed_0/1VII.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 5.376 A
- tm_score_ca_ordered: 0.12785167016566487
- heavy_atom_rmsd: 6.465 A
- sidechain_heavy_atom_rmsd: 7.347 A
- **all-atom quality (honest):** heavy 6.465 A, sidechain 7.347 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 15
- distogram_pairs: 99
- bin_accuracy: 0.232

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=27
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=6.2563947566618054 -> 5.203822365815201 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.375947560378862
- ga_delta_rmsd: -0.6135149491728065  ga_fitness_mode: energy
- pre_local_rmsd: 5.375965284215576  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** N19-K24 → 22 conflicts (88%)
- explained: 22/25 conflicts by 1 root cause(s)
- metrics: hubs=11 (frac 0.324), conflicts/hub=2.3, max_incompat=6.12Å, chain_span=0.912
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): N19-K24 — explain ~22/25 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L1** — severity 8.18, 4 conflict(s); suspect input ~`G33` (group: push_out)
  - push-out (wants farther): K24@17.7Å(now 12.8,conf 0.55), L20@17.6Å(now 10.5,conf 0.55), F10@9.9Å(now 4.3,conf 0.55)
  - L20↔G33: targets 17.6/6.7Å but partners are 4.8Å apart → too_close_together by 6.1Å
  - L20↔F17: targets 17.6/11.7Å but partners are 1.3Å apart → too_close_together by 4.6Å
  - K24↔G33: targets 17.7/6.7Å but partners are 8.3Å apart → too_close_together by 2.7Å
- **E31** — severity 5.44, 3 conflict(s); suspect input ~`A16` (group: push_out)
  - push-out (wants farther): A16@16.7Å(now 12.7,conf 0.55), N19@16.4Å(now 7.8,conf 0.55), W23@11.8Å(now 6.7,conf 0.55), L20@14.1Å(now 8.9,conf 0.55), K24@10.0Å(now 4.7,conf 0.55)
  - L28↔A16: targets 4.8/16.7Å but partners are 8.2Å apart → too_close_together by 3.7Å
  - L28↔N19: targets 4.8/16.4Å but partners are 8.0Å apart → too_close_together by 3.5Å
  - L28↔L20: targets 4.8/14.1Å but partners are 6.6Å apart → too_close_together by 2.7Å
- **K24** — severity 5.38, 3 conflict(s); suspect input ~`L28` (group: push_out)
  - push-out (wants farther): E4@21.6Å(now 16.4,conf 0.61), S2@20.5Å(now 17.0,conf 0.59), L1@17.7Å(now 12.8,conf 0.55), E31@10.0Å(now 4.7,conf 0.55)
  - E4↔L28: targets 21.6/6.0Å but partners are 11.8Å apart → too_close_together by 3.8Å
  - L28↔L1: targets 6.0/17.7Å but partners are 8.2Å apart → too_close_together by 3.5Å
  - S2↔L28: targets 20.5/6.0Å but partners are 12.1Å apart → too_close_together by 2.5Å
- **S2** — severity 4.40, 4 conflict(s); suspect input ~`V9` (group: push_out)
  - push-out (wants farther): W23@22.4Å(now 19.0,conf 0.66), K24@20.5Å(now 17.0,conf 0.59), N19@18.2Å(now 15.5,conf 0.55)
  - W23↔V9: targets 22.4/10.4Å but partners are 9.2Å apart → too_close_together by 2.8Å
  - K24↔G33: targets 20.5/10.1Å but partners are 8.3Å apart → too_close_together by 2.1Å
  - W23↔G33: targets 22.4/10.1Å but partners are 10.6Å apart → too_close_together by 1.6Å
- **V9** — severity 4.37, 2 conflict(s); suspect input ~`K29` (group: push_out)
  - push-out (wants farther): L22@17.8Å(now 7.8,conf 0.55), A16@13.4Å(now 9.5,conf 0.55)
  - L22↔K29: targets 17.8/9.2Å but partners are 4.2Å apart → too_close_together by 4.4Å
  - L22↔E31: targets 17.8/9.3Å but partners are 4.8Å apart → too_close_together by 3.6Å
- **N19** — severity 4.12, 2 conflict(s); suspect input ~`S15` (group: push_out)
  - push-out (wants farther): S2@18.2Å(now 15.5,conf 0.55), D3@17.0Å(now 14.0,conf 0.55), E31@16.4Å(now 7.8,conf 0.55), K32@15.9Å(now 12.0,conf 0.55)
  - S2↔S15: targets 18.2/7.6Å but partners are 6.7Å apart → too_close_together by 3.9Å
  - D3↔S15: targets 17.0/7.6Å but partners are 5.8Å apart → too_close_together by 3.6Å

## Secondary Structure (DSSP-like)

- helix(H)=25 · strand(E)=7 · 3-10(G)=0 · coil(C)=2

```
CEHEHHHEHHHHHHHEEHHHHHHEHHHHHHHEHC
```

## Backbone H-bond Network

- total=29 · helix(i→i+4)=18 · sheet=11
  - D3 ↔ K7  (helix)
  - D5 ↔ V9  (helix)
  - F6 ↔ F10  (helix)
  - K7 ↔ G11  (helix)
  - V9 ↔ T13  (helix)
  - F10 ↔ R14  (helix)
  - G11 ↔ S15  (helix)
  - R14 ↔ A18  (helix)
  - S15 ↔ N19  (helix)
  - A18 ↔ L22  (helix)
  - N19 ↔ W23  (helix)
  - P21 ↔ Q25  (helix)
  - L22 ↔ Q26  (helix)
  - W23 ↔ N27  (helix)
  - Q25 ↔ K29  (helix)
  - Q26 ↔ K30  (helix)
  - N27 ↔ E31  (helix)
  - K29 ↔ G33  (helix)
  - S2 ↔ A8  (sheet)
  - S2 ↔ A16  (sheet)
  - … +9 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=6 · exposed=17 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=221 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=125 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.5785 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=15 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
